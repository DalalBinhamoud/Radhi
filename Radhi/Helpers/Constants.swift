//
//  Constants.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import Foundation
import SwiftUI

struct Constants {
    enum Colors {
        static let primary = Color(red: 0.73, green: 0.58, blue: 0.16)
        static let  secondary = Color(red: 0.01568627450980392, green: 0.1411764705882353, blue: 0.29411764705882354)
        static let light = Color(red: 0.93, green: 0.93, blue: 0.93)
        static let label = Color.white
        static let error = Color.red
    }

    enum MaxLength {
        static let textEditor = 250
        static let phoneField = 10
        static let textLines = 4
    }

    enum CustomFontSize {
        static let largeTxt = CGFloat(30)
        static let title = CGFloat(24)
        static let subtitle = CGFloat(18)
    }

    enum Opacity {
        static let disabledButton = 0.3
    }

    enum Regex {
        static let email = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
        static let password = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$"
    }

    enum Spacing {
        static let small = 10.0
        static let medium = 20.0
        static let large = 30.0
    }
}
