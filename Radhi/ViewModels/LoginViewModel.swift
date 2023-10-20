//
//  LoginViewModel.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
//import FirebaseFirestore
//import FirebaseAuth

@MainActor
class LoginViewModel: ObservableObject {

    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false


    var areFieldsEmpty: Bool{
        [email,password].contains(where: \.isEmpty)
    }

    var isLoginComplete: Bool {
        if !Util.isEmailValid(email) || areFieldsEmpty {
                return false
            }
            return true
        }




}
