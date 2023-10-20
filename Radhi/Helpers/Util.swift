//
//  Util.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation

class Util{
    static func isEmailValid(_ email:String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    Constants.Regex.emailRegex)
        return emailTest.evaluate(with: email)
    }

}
