//
//  SingUpView.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 14.05.2022.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: ViewModel
    
   // @Environment(\.presentationMode) var presentationMode
    
    
    @State private var email = ""
    @State private var password = ""
    
    
    init() {
        // Color of navigationTitle Large
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        // Color of navigationTitle Inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
    }
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [Color("buttonColor"), Color("backgroundColor"), Color.blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                
                VStack {
                    Image("welcomeGrape")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .offset(y: 70)
                    
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    Group {
                        TextField("Enter email", text: $email)
                            .padding()
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .foregroundColor(.secondary)
                            .background(.white)
                            .cornerRadius(30)
                            .frame(width: 320, height: 60)
                        
                        SecureField("Enter password", text: $password)
                            .padding()
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .foregroundColor(.secondary)
                            .background(.white)
                            .cornerRadius(30)
                            .frame(width: 320, height: 60)
                    } .offset(y: -50)
                    
                    
                    Button("", action: {
                        // Check that fields are not empty
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        // SignUp func
                        viewModel.signUp(email: email, password: password)
                        
                        // To close the modal view
                      //  presentationMode.wrappedValue.dismiss()
                    })
                    .buttonStyle(CustomButtonStyle(buttonName: "Sing Up"))
                    
                    Spacer()
                    
                    
                } .ignoresSafeArea(.keyboard)
            } .onTapGesture { self.endTextEditing() }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.light)
    }
}
