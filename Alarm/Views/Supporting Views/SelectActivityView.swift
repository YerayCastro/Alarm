//
//  SelectActivityView.swift
//  Alarm
//
//  Created by Yery Castro on 3/7/23.
//

import SwiftUI

struct SelectActivityView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var currentColor: Color {
        mainColors[currentColorIndex]
    }
    var nextIndex: Int {
        (currentColorIndex + 1) % mainColors.count
    }
    var body: some View {
        HStack(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(activities, id: \.self) { activity in
                        let isSelectedActivity = activity == currentActivity
                        Image(systemName: activity)
                            .font(isSelectedActivity ? .title2 : .subheadline)
                            .foregroundColor(isSelectedActivity ? currentColor : nickel)
                            .opacity(isSelectedActivity ? 1.0 : 0.7)
                            .onTapGesture {
                                withAnimation {
                                    currentActivity = activity
                                }
                            }
                    }
                }
            }
            
            Circle()
                .fill(currentColor)
                .frame(width: 20, height: 20)
                .shadow(
                    color: currentColor.opacity(0.7),
                    radius: 10,
                    x: 0,
                    y: 5)
                .overlay(
                Circle()
                    .stroke(lineWidth: 2)
                )
                .onTapGesture {
                    withAnimation {
                        currentColorIndex = nextIndex
                    }
                }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 2)
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke( nickel, lineWidth: 1)
        )
    }
}

struct SelectActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SelectActivityView(currentColorIndex: .constant(0), currentActivity: .constant(activities[0]))
            .padding(.horizontal)
    }
}
