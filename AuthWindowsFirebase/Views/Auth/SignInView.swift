//
//  SignInView.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 14.05.2022.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var signUpPresented = false
    
    
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
                    guard !email.isEmpty, !password.isEmpty else { return }
                    // SignIn func
                    viewModel.signIn(email: email, password: password)
                })
                .buttonStyle(CustomButtonStyle(buttonName: "Sing In"))
                 .offset(y: -10)
                
                Button("Still don't have an accaunt?") {
                    signUpPresented.toggle()
                } .sheet(isPresented: $signUpPresented, content: {
                    NavigationView { SignUpView() }
                    
                })
                       .foregroundColor(.white)
                       .offset(y: 90)
                
                Spacer()
                
            } .ignoresSafeArea(.keyboard)
        } .onTapGesture { self.endTextEditing() }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
