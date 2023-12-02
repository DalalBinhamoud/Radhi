//
//  RegistrationView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct RegistrationView: View {

    // MARK: Properties

    @ObservedObject  var registerVM: RegistrationViewModel

    init(registerVM: RegistrationViewModel) {
        self.registerVM = registerVM
    }

    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .center, spacing: Constants.Spacing.medium) {

                    fields

                    // MARK: Color picker
                    ColorPicker("select_primary_brand_color", selection: $registerVM.selectedPrimaryColor)
                        .foregroundColor(Constants.Colors.label)
                    ColorPicker("select_secondary_brand_color", selection: $registerVM.selectedSecondaryColor)
                        .foregroundColor(Constants.Colors.label)

                    // MARK: number of emojis
                    HStack {
                        Text("num_of_emogis").foregroundColor(.white)
                            .font(Font.headline)
                        RadioButtonGroup(selectedId: registerVM.numOfEmojis) { selected in
                            registerVM.numOfEmojis = selected
                        }
                    }

                    // MARK: Action Button
                    registerButton()
                }.padding()
            }
        }.background(Constants.Colors.secondary)
    }

    @ViewBuilder
    var fields: some View {
        VStack(spacing: Constants.Spacing.medium) {
            CustomEmailField(email: $registerVM.email)

            // password field
            CustomPasswordField(
                password: $registerVM.password,
                shouldValidatePassword: true
            )

            // confirm password field
            CustomPasswordField(
                password: $registerVM.confirmPW,
                shouldValidatePassword: true,
                title: "confirm_password",
                passwordType: .confirm,
                passwordToCompareWith: $registerVM.password
            )

            CustomRequiredTextField(label: "brand_name", text: $registerVM.brandName)
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
        RegistrationView(registerVM: RegistrationViewModel(router: Router()))
    }
}
