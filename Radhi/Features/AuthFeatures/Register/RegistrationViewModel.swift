//
//  RegistrationViewModel.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {

    // MARK: - Required Properties
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPW = ""
    @Published var brandName = ""
    @Published var numOfEmojis = 3
    @Published var selectedPrimaryColor = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
    @Published var selectedSecondaryColor = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)

    // MARK: - Optional Properties
    @Published var contactNumber = ""
    @Published var twitter = ""
    @Published var instagram = ""
    @Published var snapchat = ""
    @Published var logo = ""
    @Published var hasBranch = false
    @Published var branches: [Branch] = []

    // MARK: - Error Handeling
    @Published var showError = false
    @Published var errorMessage = ""

    var areRequiredFieldsEmpty: Bool {
        [email, password, confirmPW, brandName ].contains(where: \.isEmpty)
    }

    var isPasswordMatch: Bool {
        password == confirmPW
    }

    var isRegisterComplete: Bool {
        Util.isEmailValid(email) && Util.isPasswordValid(password) && !areRequiredFieldsEmpty && isPasswordMatch
    }

    func register() {
        // TODO: call registration service
    }
}
