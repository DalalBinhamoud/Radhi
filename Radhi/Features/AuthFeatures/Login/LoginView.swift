//
//  LoginView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct LoginView: View {

    @Binding var selectedLanguage: String
    @EnvironmentObject var router: Router
    @StateObject var loginVM = LoginViewModel()


    var body: some View {
            GeometryReader{ geo in
                ZStack{
                    VStack(alignment: .center){

                        languageSelector
                        Spacer()
                        Image("logo").resizable().scaledToFill()
                            .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.4)

                        CustomEmailField(email: $loginVM.email)

                        CustomPasswordField(password: $loginVM.password, showPassword: $loginVM.showPassword)

                        loginButton

                        registerButton

                        Spacer()
                    }.padding()
                }.background(Constants.Colors.secondaryColor)

            }  .alert("error", isPresented: $loginVM.showError){
                Button("close"){}
            } message:{
                Text(loginVM.errorMsg)
            }.onAppear {
                self.loginVM.setup(self.router)
            }
        }

    @ViewBuilder
    var languageSelector : some View {
        HStack{
            Spacer()
            Button(action: {
                selectedLanguage = selectedLanguage == "ar" ? "en" : "ar"
            }) {
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
        Button(action: loginVM.login){
            Text("login")
                .btnLabelTextStyle()
        }
        .background(.black.opacity(0.3))
        .disabled(!loginVM.isLoginButtonEnabled)
            .cornerRadius(40)
            .padding(.vertical)
            .alert("credential_error", isPresented: $loginVM.showError) {
            Button("ok", role: .cancel) { }
        }
    }

    @ViewBuilder
    var registerButton: some View {
        HStack{
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
