//
//  AppView.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 15.05.2022.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Here will be App")
            
            Spacer()
            
            Button("") { viewModel.signOut() }
                .buttonStyle(CustomButtonStyle(buttonName: "Log Out"))
            
            Spacer()
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
