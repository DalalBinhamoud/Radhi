//
//  Router.swift
//  Radhi
//
//  Created by Dalal Macbook on 20/10/2023.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {

    public enum Routes: Codable, Hashable {
        case login
        case register
        case home(HomeRoutes)
    }

    @Published var navPath = NavigationPath()

    func push(to route: Routes) {
        navPath.append(route)
    }

    func pop() {
        navPath.removeLast()
    }

    func popToRoot() {
        navPath.removeLast(navPath.count)
    }

    func replaceRootWith(_ route: Routes) {
        popToRoot()
        navPath.append(route)
    }
}

extension Router {
    public enum HomeRoutes: Codable, Hashable, Equatable {
        case dashboard
        case submitReview
    }

}
