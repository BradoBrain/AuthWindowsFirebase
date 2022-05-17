//
//  ViewModel.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 15.05.2022.
//

import Foundation
import FirebaseAuth
import Firebase
import GoogleSignIn
import SwiftUI

class ViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    // To check sign in status
//    @Published var signedIn = false
    @AppStorage("signedIn") var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    // Sign In function
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    // Sign Up function
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    // Sign out function
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    
    
    // For Google
    func handleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) { [self] user, error in

          if let error = error {
              print(error.localizedDescription)
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

            auth.signIn(with: credential) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                  return
                }
                guard let user = result?.user else {
                    return
                }
                print(user.displayName ?? "Success")
                
                self.signedIn = true
                
            }
        }
        


    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
    
}


extension View {

}
