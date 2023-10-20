//
//  LoginView.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

struct LoginView: View {

    @State private var showPassword = false
    @Binding var navigateToHome:Bool
    @Binding var selectedLanguage: String
    @State private var showError = false
    @State private var errorMsg = ""
    @ObservedObject var loginVM = LoginViewModel()

    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ZStack{
                    VStack(alignment: .center){

                        HStack{
                            Spacer()
                            Button(action: {
                                selectedLanguage = selectedLanguage == "ar" ? "en" : "ar"
                            }) {
                                Text(selectedLanguage == "en" ? "ع" : "En")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 2)
                                        .stroke()
                                        .fill(.white)
                                    )
                            }
                        }

                        Spacer()
                        Image("logo").resizable().scaledToFill().frame(width: geo.size.width * 0.4, height: geo.size.height * 0.4)


                        CustomEmailField(email: $loginVM.email)

                        CustomPasswordField(password: $loginVM.password, showPassword: $showPassword)

                        Button(action:  {
                           // TODO: // call logoin function
                        } ){
                            Text("login")
                                .btnLabelTextStyle()
//                                .frame(maxWidth: 150)
                        }.background(.black.opacity(0.3))
                            .cornerRadius(40)
                            .padding(.vertical)
                            .alert("credential_error", isPresented: $loginVM.showError) {
                            Button("ok", role: .cancel) { }
                        }
                        HStack{
                            Text("dont_have_account").foregroundColor(Constants.Colors.labelColor)
                            NavigationLink{
                                RegistrationView().environment(\.locale, .init(identifier: selectedLanguage))
                            } label: {
                                Text("register")
                            }
                        }

                        Spacer()
                    }.padding()
                }.background(Constants.Colors.secondaryColor)

            }  .alert("error", isPresented: $showError){
                Button("close"){}
            } message:{
                Text(errorMsg)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(navigateToHome: .constant(false), selectedLanguage: .constant("ar"))
    }
}
