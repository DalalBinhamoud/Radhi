//
//  CustomEmailField.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct CustomEmailField: View {

    @Binding var email: String
    @State private var showError = false

    var body: some View {
        VStack(alignment: .leading) {
            TextField("email", text: $email, prompt: Text("email"))
                .textFieldStyle()
                .keyboardType(.emailAddress)
                .onChange(of: email) {_ in
                    //TODO: only show the error when user left the focus on field
                    showError = !Util.isEmailValid(email)
                }
            showEmailError()

        }
    }

    @ViewBuilder
    func showEmailError() -> some View {
        if showError {
            Text("email_validation")
                .foregroundColor(Constants.Colors.errorColor).padding(5)
        }
    }
}

struct CustomEmailField_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmailField(email: .constant(""))
    }
}
