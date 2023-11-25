//
//  Util.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
import SwiftUI

class Util{
    static func isEmailValid(_ email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    Constants.Regex.email
        )
        return emailTest.evaluate(with: email)
    }

    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       Constants.Regex.password)
        return passwordTest.evaluate(with: password)
    }

    static func isPasswordMatch(_ password:String,with confirmPassword:Binding<String>? = .constant("")) -> Bool {
        password == confirmPassword?.wrappedValue
    }


}
