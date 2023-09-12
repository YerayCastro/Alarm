//
//  TimePicker.swift
//  Alarm
//
//  Created by Yery Castro on 3/7/23.
//

import SwiftUI

struct TimePicker: View {
    @Binding var time: Date
    let scale: CGFloat
    
    var body: some View {
        DatePicker("",
                   selection: $time,
        displayedComponents: .hourAndMinute)
        .scaleEffect(scale)
        .labelsHidden()
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(
            time: .constant(Date()),
            scale: 1.3)
    }
}
