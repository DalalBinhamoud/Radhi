//
//  HomeView.swift
//  Radhi
//
//  Created by Dalal Macbook on 28/11/2023.
//

import SwiftUI

struct HomeView: View {

    @State var currentTab: Router.HomeRoutes
    @EnvironmentObject private var router: Router
    var body: some View {
            VStack {

                selectedTab
                Spacer()
                CustomTabBar(currentTap: $currentTab)

            }
            .background(Constants.Colors.ligthColor)
            .onChange(of: currentTab) {
                router.replaceRootWith(.home($0))
            }
            .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder var selectedTab: some View {
        switch currentTab {
        case .dashboard:
            DashboardView()
        case .submitReview:
            SubmitReviewView()
        }
    }
}

#Preview {
    HomeView(currentTab: .dashboard)
}
