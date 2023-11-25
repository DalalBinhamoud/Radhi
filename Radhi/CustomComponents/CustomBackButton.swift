//
//  CustomBackButton.swift
//  Radhi
//
//  Created by Dalal Macbook on 25/11/2023.
//

import SwiftUI

struct CustomBackButton: View {
        let title: String
        let action: () -> Void

        var body: some View {
            HStack {
                Button(action: action) {
                    Image(systemName: "arrow.backward")
                }
                Spacer()
                Text(title)
                    .headerTitleStyle()

            }

        }
    }

#Preview {
    CustomBackButton(title: "", action: { print("do someting") })
}
