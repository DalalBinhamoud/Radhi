//
//  LoginViewModel.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
import Combine

//@MainActor
class LoginViewModel: ObservableObject {

    @Published var router: Router?

    // MARK: - UI actions

    @Published var showPassword = false
    @Published var errorMsg = ""
    
    var authService = AuthService()
    var cancellables = Set<AnyCancellable>()

//      init(authService: AuthService) {
//          self.authService = authService
//      }


    // MARK: - User Inputs

    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false

    // MARK: - init
    func setup(_ router: Router) {
        self.router = router
     }

    // MARK: - Validation
    var areFieldsEmpty: Bool{
        [email,password].contains(where: \.isEmpty)
    }

    var isLoginComplete: Bool {
        Util.isEmailValid(email) && !areFieldsEmpty
        }

    // MARK: - Functions
    
    func login() {
        // TODO: call logoin function
        self.router?.push(to: .dashboard)
    }


    func tapToRegister() {
        self.router?.push(to: .register)
    }

}
