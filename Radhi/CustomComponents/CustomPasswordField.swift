//
//  CustomPasswordField.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct CustomPasswordField: View {

    @Binding var password: String
    var title: String = "password"
    @State private var showPassword = false

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if showPassword {
                    TextField(LocalizedStringKey(title), text: $password).textFieldStyle()
                } else {
                    SecureField(LocalizedStringKey(title), text: $password)
                        .textFieldStyle()
                }
            }
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye" : "eye.slash").imageScale(.large)
            }.padding(.horizontal, 25)
        }
    }

}

struct CustomPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordField(password: .constant(""))
    }
}
