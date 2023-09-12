//
//  MainGradient.swift
//  Alarm
//
//  Created by Yery Castro on 1/7/23.
//

import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad = 0.5
    var opacityRadGrad = 1.0
    var yellowColor = yellow
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                blue,purple,pink
                ],
                startPoint: .top,
                endPoint: .bottom)
            .opacity(opacityLinGrad)
            
            RadialGradient(
                colors: [yellowColor, .clear],
                center: .bottom,
                startRadius: startRadius,
                endRadius: endRadius)
            .opacity(opacityRadGrad)
            .scaleEffect(x: scaleX)
        }
    }
}

struct MainGradient_Previews: PreviewProvider {
    static var previews: some View {
        MainGradient( endRadius: 75)
            .frame(width: screenWidth, height: 100)
    }
}
