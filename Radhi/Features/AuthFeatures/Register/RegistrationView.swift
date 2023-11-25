//
//  RegistrationView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct RegistrationView: View {

    // MARK: Properties

    @ObservedObject  var registrationVM = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var showAlert = false
    @State private var showError = false
    @State private var errorMsg = ""
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    var body: some View {
        ScrollView {
            GeometryReader { geo in
                ZStack {
                    VStack(alignment: .center) {
                        Spacer()
                        Image("background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                        fields()

                        // MARK: number of emojies
                        Text("number of Emojies").foregroundColor(.white)
                        Picker("number of emojies",
                               selection: $registrationVM.numOfEmojies) {
                            Text("3")
                            Text("5")
                        }.pickerStyle(.segmented).background(Constants.Colors.labelColor)

                        // MARK: Color picker
                        ColorPicker("Alignment Guides", selection: $bgColor)

                        // MARK: Action Button
                        registerButton()
                    }.padding()
                }.background(Constants.Colors.secondaryColor)
            }
        }.background(Constants.Colors.secondaryColor)
    }

    @ViewBuilder
    func fields() -> some View {
        VStack {
            CustomEmailField(email: $registrationVM.email)

            // password field
            CustomPasswordField(password: $registrationVM.password)

            // confirm password field
            CustomPasswordField(password: $registrationVM.confirmPW)

            TextField("brand name", text: $registrationVM.brandName).textFieldStyle()
        }
    }

    @ViewBuilder
    func registerButton () -> some View {
        Button(action:  {
            Task{

            }

        } ){
            Text(NSLocalizedString("register", comment: "")).btnLabelTextStyle()
        }.background(.black.opacity(0.3)).cornerRadius(40).padding()
            .alert(NSLocalizedString("error", comment: ""), isPresented: $showError){
                Button(NSLocalizedString("close", comment: "")){}
            } message:{
                Text(NSLocalizedString(errorMsg, comment: ""))
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(NSLocalizedString("registration_request", comment: "")),
                      message: Text(NSLocalizedString("registration_request_msg",
                                                      comment: "")),
                      dismissButton: .default(Text(NSLocalizedString("ok", comment: ""))))
            }
            .alert(NSLocalizedString("error", comment: ""), isPresented: $registrationVM.showErrorOfBE){
                Button(NSLocalizedString("close", comment: "")){}
            } message:{
                Text(registrationVM.showErrorMsgOfBE)
            }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
