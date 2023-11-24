//
//  LoginRequest.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import Foundation
import SwiftUI

struct LoginRequest {
    var urlRequest: URLRequest?

    mutating func setupRequest() -> URLRequest? {
        guard let url = URL(string: "https://domain/home/app") else {
            preconditionFailure("Invalid URL format")
        }

        urlRequest = URLRequest(url: url)
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest?.httpMethod = HttpMethods.post
        return urlRequest
    }
}
