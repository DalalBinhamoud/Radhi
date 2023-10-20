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
        case submitReview
        case dashboard
        case branhces
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
}
