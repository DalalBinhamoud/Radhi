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
                         RegistrationView(
                        registerVM: .init(router: router)
                         )
                             .withCustomBackButton(title: NSLocalizedString("register", comment: ""), router)
                     case .login:
                         LoginView(selectedLanguage: $selectedLanguage)
                     case .home:
                         HomeView(currentTab: .dashboard)
                             .environmentObject(router)
                     }
                 }
             }
             .environmentObject(router)
             .environment(\.layoutDirection, selectedLanguage == "en" ? .leftToRight :  .rightToLeft)
             .environment(\.locale, .init(identifier: selectedLanguage))
         }
     }
}

extension View {
    func withCustomBackButton(title: String, _ router: Router) -> some View {
        self.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomBackButton(title: title) {
                        router.pop()
                    }
                }
            }
    }
}
