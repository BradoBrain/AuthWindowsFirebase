//
//  GoogleButtonStyle.swift
//  AuthWindowsFirebase
//
//  Created by Artem Vinogradov on 17.05.2022.
//

import SwiftUI

struct GoogleButtonStyle: ButtonStyle {
    @State var buttonName: String
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                    Text(buttonName)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 60)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.5), value: configuration.isPressed)
            )
    }
}


struct GoogleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
