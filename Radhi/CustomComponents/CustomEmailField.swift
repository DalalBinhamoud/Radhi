//
//  CustomEmailField.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct CustomEmailField: View {

    @Binding var email : String
    @State private var showError = true

    var body: some View {
        VStack(alignment: .leading){
            TextField("email", text: $email , prompt: Text("email"))
                .textFieldStyle()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .onChange(of: email){_ in
             showError = Util.isEmailValid(email)
                }
               
            Text(showError ? "" : "email_validation").foregroundColor(Constants.Colors.labelColor).padding(5)

        }
    }
}

struct CustomEmailField_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmailField(email: .constant(""))
    }
}
