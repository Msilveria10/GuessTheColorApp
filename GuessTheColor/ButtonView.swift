//
//  ButtonView.swift
//  GuessTheColor
//
//  Created by Matt Silveria on 7/26/22.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonColor: Color
    var buttonName: String
    
    var onClick: () -> Void
    
    var body: some View {
        
        Button {
            onClick()
        } label: {
           Text(buttonName)
                .padding()
                .frame(width: 100.0, height: 50.0)
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(23)
                .shadow(color: .gray, radius: 20, x: 10, y: 5)
                .padding()
        }
        .buttonStyle(.plain)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(buttonColor: .yellow, buttonName: "Yellow"){}
            ButtonView(buttonColor: .blue, buttonName: "blue"){}
        }
    }
}
