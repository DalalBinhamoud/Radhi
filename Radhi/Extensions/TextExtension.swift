//
//  TextExtension.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

extension Text {

    func mainTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.custom("riesling",size: Constants.customFontSize.largeTxt))
    }

    func labelTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.custom("riesling",size: Constants.customFontSize.subtitle,relativeTo: .title2))
    }

    func btnLabelTextStyle() -> some View {
        self.font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor)
            .padding(20)
            .padding([.horizontal], 30)
    }

}


extension TextField {
    func TextFieldStyle() -> some View {
        self.padding(20).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(.leading)
    }
}

extension SecureField {
    func TextFieldStyle() -> some View {
        self.padding(25).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(.leading)
    }
}
