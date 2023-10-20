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

    @Published var router: Router?

    // MARK: - UI actions

    @Published var showPassword = false
    @Published var errorMsg = ""


    // MARK: - User Inputs

    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false


    // MARK: - Validation
    var areFieldsEmpty: Bool{
        [email,password].contains(where: \.isEmpty)
    }

    var isLoginComplete: Bool {
        if !Util.isEmailValid(email) || areFieldsEmpty {
                return false
            }
            return true
        }

    // MARK: - init
    func setup(_ router: Router) {
        self.router = router
     }

    // MARK: - Functions
    
    func login() {
        // TODO: call logoin function
        self.router?.push(to: .dashboard)
    }


    @MainActor
    func tapToRegister() {
        self.router?.push(to: .register)
    }

}
