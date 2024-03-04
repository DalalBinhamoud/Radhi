//
//  DashboardView.swift
//  Radhi
//
//  Created by Dalal Macbook on 20/10/2023.
//

import SwiftUI
import Charts

struct DashboardView: View {
    var body: some View {
        VStack {
            DateFilter()
            Spacer()
            LineChart()
                .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct LineChart: View {

    // mock
    let currentWeek: [ReviewCount] = [
        ReviewCount(day: "20220717", reviews: 20),
        ReviewCount(day: "20220718", reviews: 30),
        ReviewCount(day: "20220719", reviews: 15),
        ReviewCount(day: "20220720", reviews: 4)
    ]
    var body: some View {
        VStack {
            GroupBox("Line Chart") {
                Chart {
                    ForEach(currentWeek) {
                        LineMark(
                            x: .value("Week Day", $0.weekday, unit: .day),
                            y: .value("Review Count", $0.reviews)
                        )
                    }
                }
            }
        }
    }
}

struct ReviewCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let reviews: Int

    init(day: String, reviews: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"

        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.reviews = reviews
    }
}
