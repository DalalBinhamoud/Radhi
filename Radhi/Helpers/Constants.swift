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
        static let primaryColor = Color(hex: "#ba952a")
        static let  secondaryColor = Color(red: 0.01568627450980392, green: 0.1411764705882353, blue: 0.29411764705882354)
        static let labelColor = Color.white
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

    enum Regex {
        static let emailRegex = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    }
}
