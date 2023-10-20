//
//  CustomPasswordField.swift
//  Radhi
//
//  Created by Dalal Macbook on 03/06/2023.
//

import SwiftUI

enum NoFlipEdge {
    case left, right
}

struct NoFlipPadding: ViewModifier {
    let edge: NoFlipEdge
    let length: CGFloat?
    @Environment(\.layoutDirection) var layoutDirection

    private var computedEdge: Edge.Set {
        if layoutDirection == .rightToLeft {
            return edge == .left ? .leading : .trailing
        } else {
            return edge == .left ? .leading : .trailing
        }
    }

    func body(content: Content) -> some View {
        content
            .padding(computedEdge, length)
    }
}

extension View {
    func padding(_ edge: NoFlipEdge, _ length: CGFloat? = nil) -> some View {
        self.modifier(NoFlipPadding(edge: edge, length: length))
    }
}
struct CustomPasswordField: View {

    @Binding var password : String
    @Binding var showPassword : Bool


    var body: some View {
        ZStack(alignment: .trailing){

            Group{
                if showPassword  {
                    TextField("password", text: $password,prompt: Text("password")).TextFieldStyle()
                        .autocapitalization(.none)
                } else{
                    SecureField("password", text: $password,prompt: Text("password")).TextFieldStyle()
                        .autocapitalization(.none)
                }
            }
            Button(action: {
                showPassword.toggle()
            }){
                Image(systemName: showPassword ? "eye" : "eye.slash").imageScale(.large)
            }.padding(.horizontal, 25)
        }
    }

}

struct CustomPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordField(password: .constant(""), showPassword: .constant(false))
    }
}
