//
//  ViewModel.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 15.05.2022.
//

import Foundation
import FirebaseAuth

class ViewModel: ObservableObject {
    let auth = Auth.auth()
    
    // To check sign in status
    @Published var signedIn = false
    
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
}
