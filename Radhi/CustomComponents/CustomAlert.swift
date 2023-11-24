//
//  CustomAlert.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import SwiftUI

struct CustomAlert: View {

    @Binding var isAlertPresented: Bool
    var title: String
    var message: String
    
    var body: some View {
        VStack {

        }.alert(isPresented: $isAlertPresented) {
            Alert(title: Text(NSLocalizedString(title, comment: "")),
                  message: Text(NSLocalizedString(message,
                                                  comment: "")),
                  dismissButton: .default(Text(NSLocalizedString("ok", comment: ""))))
        }
    }
}

#Preview {
    CustomAlert(isAlertPresented: .constant(false), title: "", message: "")
}



