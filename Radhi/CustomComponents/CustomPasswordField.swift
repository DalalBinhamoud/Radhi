//
//  CustomPasswordField.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

enum PasswordType {
    case regular
    case confirm
}

struct CustomPasswordField: View {

    @Binding var password: String
    var shouldValidatePassword: Bool?
    var title: String?
    var passwordType: PasswordType = .regular
    var passwordToCompareWith: Binding<String>?

    // MARK: - Internal property
    @State private var showPassword = false
    @State private var showError = false

    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                Group {
                    if showPassword {
                        TextField(LocalizedStringKey(title ?? "password"), text: $password)
                            .textFieldStyle()
                            .onChange(of: password) {_ in
                                onChange()
                            }

                    } else {
                        SecureField(LocalizedStringKey(title ?? "password"), text: $password)
                            .textFieldStyle()
                            .onChange(of: password) {_ in
                                onChange()
                            }

                    }
                }
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye" : "eye.slash").imageScale(.large)
                }.padding(.horizontal, 25)
            }
            showPasswordError()
        }
    }

    func onChange() {
        //TODO: only show the error when user left the focus on field
        if shouldValidatePassword ?? false {
            showError = validateBasedOnPasswordType(passwordType)
        }
    }

    func validateBasedOnPasswordType(_ type: PasswordType) -> Bool {
        switch(type) {
        case .regular: return !Util.isPasswordValid(password)
        case .confirm: return !Util.isPasswordMatch(password, with: passwordToCompareWith)
        }
    }

    @ViewBuilder
    func showPasswordError() -> some View {
        if showError {
            Text(LocalizedStringKey(passwordType == .regular ? "password_error" : "confirm_password_error"))
                .foregroundColor(Constants.Colors.errorColor).padding(5)
        }
    }

}

struct CustomPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordField(password: .constant(""))
    }
}
