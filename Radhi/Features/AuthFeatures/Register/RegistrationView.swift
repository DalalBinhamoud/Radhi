//
//  RegistrationView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct RegistrationView: View {

    // MARK: Properties

    @ObservedObject  var registerVM = RegistrationViewModel()

    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .center, spacing: Constants.Spacing.medium) {

                    fields

                    // MARK: number of emojis
                    Text("num_of_emogis").foregroundColor(.white)
                    Picker("num_of_emogis",
                        selection: $registerVM.numOfEmojis) {
                        Text("3")
                        Text("5")
                    }.pickerStyle(.segmented).background(Constants.Colors.label)

                    // MARK: Color picker
                    ColorPicker("select_primary_brand_color", selection: $registerVM.selectedPrimaryColor)
                        .foregroundColor(Constants.Colors.label)
                    ColorPicker("select_secondary_brand_color", selection: $registerVM.selectedSecondaryColor)
                        .foregroundColor(Constants.Colors.label)

                    // MARK: Action Button
                    registerButton()
                }.padding()
            }
        }.background(Constants.Colors.secondaryColor)
    }

    @ViewBuilder
    var fields: some View {
        VStack(spacing: Constants.Spacing.medium) {
            CustomEmailField(email: $registerVM.email)

            // password field
            CustomPasswordField(password: $registerVM.password)

            // confirm password field
            CustomPasswordField(password: $registerVM.confirmPW, title: "confirm_password")

            TextField("brand_name", text: $registerVM.brandName).textFieldStyle()
        }
    }

    @ViewBuilder
    func registerButton () -> some View {
        Button {
            registerVM.register()
        } label: {
            Text("register").btnLabelTextStyle()
        }.primaryButtonStyle()
            .opacity(!registerVM.isRegisterComplete ? Constants.Opacity.disabledButton : 1)
            .disabled(!registerVM.isRegisterComplete)
            .alert("error", isPresented: $registerVM.showError) {
                Button("close") { }
            } message: {
                Text(registerVM.errorMessage)
            }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
