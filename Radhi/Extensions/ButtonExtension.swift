//
//  ButtonExtension.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import SwiftUI


extension Button {

    func primaryButtonStyle() -> some View {
        self.background(.black.opacity(0.3))
            .cornerRadius(40)
            .padding(.vertical)
    }
}
