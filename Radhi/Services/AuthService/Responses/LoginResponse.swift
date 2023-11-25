//
//  LoginResponse.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import Foundation

struct LoginResponse: Codable {
    var message: String

    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
