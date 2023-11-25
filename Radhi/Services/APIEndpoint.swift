//
//  APIEndpoint.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import Foundation

enum APIEndpoint {
    case userLogin(email: String, password: String)
    case menuList
}

extension APIEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .userLogin(let email, let password):
            guard let url = URL(string: "https://jcouserapidev.oxxo.co.id/home/app") else {
                preconditionFailure("Invalid URL format")
            }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Constants.API_TOKEN", forHTTPHeaderField: "Authorization")
            request.httpMethod = "POST"

            let body: [String: Any] = ["email": email, "password": password]

            let rb = try! JSONSerialization.data(withJSONObject: body)
            request.httpBody = rb

            return request
        case .menuList:
            guard let url = URL(string: "https://jcouserapidev.oxxo.co.id/home/app")
                else {preconditionFailure("Invalid URL format")}
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Constants.API_TOKEN", forHTTPHeaderField: "Authorization")
            request.httpMethod = "POST"
            return request
        }

    }
}
