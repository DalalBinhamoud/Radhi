//
//  LoginView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct LoginView: View {

    // MARK: Properties

    @Binding var selectedLanguage: String
    @EnvironmentObject var router: Router
    @ObservedObject var loginVM = LoginViewModel()

    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(alignment: .center, spacing: Constants.Spacing.medium) {

                    languageSelector

                    Image("logo").resizable().scaledToFill()
                        .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.4)

                    CustomEmailField(email: $loginVM.email)

                    CustomPasswordField(password: $loginVM.password)

                    loginButton

                    registerButton

                }.padding()
            }
            .background(Constants.Colors.secondaryColor)

            .alert("error", isPresented: $loginVM.showError) {
                Button("close") { }
            } message: {
                Text(loginVM.errorMsg)
            }
        }
        .background(Constants.Colors.secondaryColor)
        .onAppear {
            self.loginVM.setup(self.router)
        }
    }

    @ViewBuilder
    var languageSelector: some View {
        HStack {
            Spacer()
            Button {
                selectedLanguage = selectedLanguage == "ar" ? "en" : "ar"
            } label: {
                Text("displayed_language")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke()
                            .fill(.white)
                    )
            }
        }
    }

    @ViewBuilder
    var loginButton: some View {
        Button(action: loginVM.login) {
            Text("login")
                .btnLabelTextStyle()
        }
        .primaryButtonStyle()
        .opacity(!loginVM.isLoginComplete ? Constants.Opacity.disabledButton : 1)
        .disabled(!loginVM.isLoginComplete)
    }

    @ViewBuilder
    var registerButton: some View {
        HStack {
            Text("dont_have_account").foregroundColor(Constants.Colors.labelColor)
            Button(action: loginVM.tapToRegister) {
                Text("register")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(selectedLanguage: .constant("ar"))
    }
}
