//
//  RadhiApp.swift
//  Radhi
//
//  Created by Dalal Macbook on 29/05/2023.
//

import SwiftUI

@main
struct RadhiApp: App {
    @ObservedObject var router = Router()

    @State private var selectedLanguage = "en"

    var body: some Scene {
         WindowGroup {
             NavigationStack(path: $router.navPath) {
                 LoginView(selectedLanguage: $selectedLanguage)
                 .navigationDestination(for: Router.Routes.self) { route in
                     switch route {
                     case .register:
                         RegistrationView()
                     case .login:
                         LoginView(selectedLanguage: $selectedLanguage)
                     case .submitReview:
                         SubmitReviewView()
                     case .dashboard:
                         DashboardView()
                     case .branhces:
                         Text("Comming Soon!")
                     }
                 }
             }
             .environmentObject(router)
             .environment(\.layoutDirection, selectedLanguage == "en" ? .leftToRight :  .rightToLeft)
             .environment(\.locale, .init(identifier: selectedLanguage))
         }
     }
}
