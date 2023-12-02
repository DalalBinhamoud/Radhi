//
//  CustomTabBar.swift
//  Radhi
//
//  Created by Dalal Macbook on 28/11/2023.
//

import SwiftUI

struct CustomTabBar: View {

    private var currentTap: Binding<Router.HomeRoutes>

    init(currentTap: Binding<Router.HomeRoutes>) {
        self.currentTap = currentTap
    }

    private func handleSelectedTap(_ tab: Router.HomeRoutes) -> Bool {
        currentTap.wrappedValue == tab
    }

    private func onTabBarTap(_ tab: Router.HomeRoutes) {
        currentTap.wrappedValue = tab
    }

    var body: some View {
        HStack {
            tabBarItem(
                title: "dashboard",
                icon: "display",
                isSelected: handleSelectedTap(.dashboard),
                onTap: { onTabBarTap(.dashboard) }
            )
            Spacer()
            tabBarItem(
                title: "add_review",
                icon: "square.and.pencil",
                isSelected: handleSelectedTap(.submitReview),
                onTap: { onTabBarTap(.submitReview) }
            )

        }
        .background(.white)
    }

    @ViewBuilder
    func tabBarItem(title: String, icon: String, isSelected: Bool, onTap: @escaping () -> Void) -> some View {
        Button(action: onTap) {
            VStack {
                Image(systemName: icon)
                Text(LocalizedStringKey(title))
                    .fontWeight(isSelected ? .bold : .regular)
            }
            .padding(StyleGuide.Padding.large)
            .foregroundColor(isSelected ? Constants.Colors.primary : Constants.Colors.secondary)

        }
    }
}

#Preview {
    CustomTabBar(currentTap: .constant(.dashboard))
}
