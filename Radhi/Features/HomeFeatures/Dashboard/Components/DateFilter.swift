//
//  DateFilter.swift
//  Radhi
//
//  Created by Dalal Macbook on 02/12/2023.
//

import SwiftUI

enum DatePickerMode {
    case daily
    case monthly
    case yearly
}

struct DateFilter: View {

    // MARK: - Properties
    @State private var selectedMode: DatePickerMode = .daily
    @State private var selectedDate = Date.now
    @State private var selectedMonth = Date().formatted(.dateTime.month())
    @State private var selectedYear = Date().formatted(.dateTime.year())

    // MARK: - Constants
    let months: [String] = Calendar.current.shortMonthSymbols
    let years = (2020..<2040).map { String($0) }

    // MARK: - Body
    var body: some View {
        HStack {
            Menu {
                Button("Daily") { selectedMode = .daily }
                Button("Monthly") { selectedMode = .monthly }
                Button("Yearly") { selectedMode = .yearly }
            } label: {
                Label("Display Mode", systemImage: "ellipsis.circle")
            }
            Text(String(describing: selectedMode))

            Spacer()
            selectedDatePicker

        }
        .padding()
    }

    @ViewBuilder
    private var selectedDatePicker: some View {
        switch selectedMode {
        case .daily:
            dayPicker
        case .monthly:
            monthPicker
        case .yearly:
            yearPicker
        }
    }

    private var dayPicker: some View {
        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
    }

    private var monthPicker: some View {
        HStack {
            Picker("", selection: $selectedMonth) {
                ForEach(months, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(InlinePickerStyle())

            Picker("", selection: $selectedYear) {
                ForEach(years, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(InlinePickerStyle())
        }
    }

    private var yearPicker: some View {
        Picker("", selection: $selectedYear) {
            ForEach(years, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(InlinePickerStyle())
    }
}

#Preview {
    DateFilter()
}
