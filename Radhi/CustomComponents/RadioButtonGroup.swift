//
//  RadioButtonGroup.swift
//  Radhi
//
//  Created by Dalal Macbook on 28/11/2023.
//

import SwiftUI

enum NumberOfEmojis: String {
    case three = "3"
    case five = "5"
}

struct RadioButtonGroup: View {
    let callback: (String) -> ()

    @State var selectedId: String = ""

    var body: some View {
        VStack {
            radioMaleMajority
            radioFemaleMajority
        }
    }

    var radioMaleMajority: some View {
        CustomRadioButton(
            id: NumberOfEmojis.three.rawValue,
            label: NumberOfEmojis.three.rawValue,
            isMarked: selectedId == NumberOfEmojis.three.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }

    var radioFemaleMajority: some View {
        CustomRadioButton(
            id: NumberOfEmojis.five.rawValue,
            label: NumberOfEmojis.five.rawValue,
            isMarked: selectedId == NumberOfEmojis.five.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

#Preview {
    RadioButtonGroup(callback: { _ in })
}
