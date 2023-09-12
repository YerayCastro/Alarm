//
//  GrayedTextView.swift
//  Alarm
//
//  Created by Yery Castro on 29/6/23.
//

import SwiftUI

struct GrayedTextView: View {
    let text: LocalizedStringKey
    var font = Font.headline
    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(font)
    }
}

struct GrayedTextView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                GrayedTextView(text: "No Alarms", font: .title)

                GrayedTextView(text: "to Anton's page", font: .title)

                
                GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.", font: .title)
            }
            .padding()
        }
    }
}

