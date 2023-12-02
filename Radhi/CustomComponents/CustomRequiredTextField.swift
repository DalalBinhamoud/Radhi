//
//  CustomTextField.swift
//  Radhi
//
//  Created by Dalal Macbook on 25/11/2023.
//

import Foundation
import SwiftUI

 public struct CustomRequiredTextField: View {

    var label: String?

    // MARK: Internal Properties
    @Binding var text: String
    @State private var showError = false



    public var body: some View {
        VStack(alignment: .leading) {
            TextField(LocalizedStringKey(label ?? ""), text: $text)
                .textFieldStyle()
                .onChange(of: text) {_ in
                    // TODO: only show the error when user left the focus on field
                    showError = text.isEmpty
                }
            showtextError()

        }
    }

    @ViewBuilder
    func showtextError() -> some View {
        if showError {
            Text("required_field")
                .foregroundColor(Constants.Colors.error).padding(StyleGuide.Padding.small)
        }
    }
}

struct CustomRequiredTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomRequiredTextField(text: .constant(""))
    }
}
