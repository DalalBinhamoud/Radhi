//
//  LoginViewModel.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {

    var router: Router?

    // MARK: - UI actions

    @Published var errorMsg = ""

    var authService = AuthService()
    var cancellables = Set<AnyCancellable>()

    // MARK: - User Inputs

    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var showError = false

    // MARK: - init
    func setup(_ router: Router) {
        self.router = router
    }

    // MARK: - Validation
    var areFieldsEmpty: Bool {
        [email, password].contains(where: \.isEmpty)
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
//        self.router?.push(to: .register)
    }

}
