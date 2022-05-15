//
//  ContentView.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.signedIn {
            AppView()
        } else { SignInView() }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
