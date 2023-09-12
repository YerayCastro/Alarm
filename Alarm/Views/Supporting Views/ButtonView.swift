//
//  ButtonView.swift
//  Alarm
//
//  Created by Yery Castro on 1/7/23.
//

import SwiftUI

struct ButtonView: View {
    let text: LocalizedStringKey
    var endRadius = 40.0
    var scaleX = 3.0
    
    var body: some View {
        Text(text)
            .foregroundColor(black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradient(
                    endRadius: endRadius,
                    scaleX: scaleX
                )
                .cornerRadius(30)
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(text: "add alarm")
            ButtonView(text: "next")
            ButtonView(text: "create")
        }.padding()
    }
}
