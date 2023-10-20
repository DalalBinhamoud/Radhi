//
//  RadhiApp.swift
//  Radhi
//
//  Created by Dalal Macbook on 29/05/2023.
//

import SwiftUI

@main
struct RadhiApp: App {
    @State private var navigateToHome = false

    @State private var selectedLanguage = "en"

    var body: some Scene {
        WindowGroup {
            LoginView(navigateToHome: $navigateToHome, selectedLanguage: $selectedLanguage).environment(\.locale, .init(identifier: selectedLanguage))
                .environment(\.layoutDirection, selectedLanguage == "en" ? .leftToRight:.rightToLeft)
        }
    }
}
