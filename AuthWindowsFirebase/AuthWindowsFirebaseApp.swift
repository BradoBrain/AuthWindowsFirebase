//
//  AuthWindowsFirebaseApp.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 14.05.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct AuthWindowsFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let viewModel = ViewModel()
        
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
