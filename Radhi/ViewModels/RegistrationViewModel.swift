//
//  RegistrationViewModel.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation




class RegistrationViewModel: ObservableObject{

    @Published var email = ""
    @Published var password = ""
    @Published var brandName = ""
    @Published var numOfEmojies = 3
    @Published var primaryColor = ""
    @Published var secondaryColor = ""
    @Published var logo = ""
    @Published var contactNumber = ""
    @Published var twitter = ""
    @Published var instagram = ""
    @Published var snapchat = ""
    @Published var hasBranch = false
    @Published var branches: [Branch] = []


    @Published var confirmPW = ""
    @Published var showErrorOfBE = false
    @Published var showErrorMsgOfBE = ""



}
