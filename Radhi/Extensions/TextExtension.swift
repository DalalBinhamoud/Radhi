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
            .font(.custom("riesling",size: Constants.CustomFontSize.largeTxt))
    }

    func labelTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.custom("riesling",size: Constants.CustomFontSize.subtitle,relativeTo: .title2))
    }

    func btnLabelTextStyle() -> some View {
        self.font(.system(size: Constants.CustomFontSize.largeTxt)).foregroundColor(Constants.Colors.label)
            .padding(20)
            .padding([.horizontal], 30)
    }

    func headerTitleStyle() -> some View {
        self.font(.system(size: Constants.CustomFontSize.title))
            .foregroundColor(Constants.Colors.label)
            .padding()
    }

}


extension TextField {
    func textFieldStyle() -> some View {
        self.padding(20).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.label)).multilineTextAlignment(.leading)
            .autocapitalization(.none)
    }
}

extension SecureField {
    func textFieldStyle() -> some View {
        self.padding(20).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.label)).multilineTextAlignment(.leading)
            .autocapitalization(.none)
    }
}
