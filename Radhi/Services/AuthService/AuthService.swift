//
//  AuthService.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import Foundation
import SwiftUI
import Combine

struct AuthService {

    var apiSession = APISession()

    func login() -> AnyPublisher<LoginResponse, NetworkError> {
        var loginRequest = LoginRequest()
        return apiSession.request(with: loginRequest.setupRequest() as! RequestBuilder, test: "")
            .eraseToAnyPublisher()
    }
    func register() {

    }
}
