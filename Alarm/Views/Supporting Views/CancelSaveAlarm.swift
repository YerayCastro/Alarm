//
//  CancelSaveAlarm.swift
//  Alarm
//
//  Created by Yery Castro on 3/7/23.
//

import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        HStack {
            // Cancel
            Button(action: {
                self.presentation
                    .wrappedValue
                    .dismiss()
            }, label: {
                Text("Cancel")
            })
            Spacer()
            // Save
            Button(action: {
                if let currentAlarmIndex = currentAlarmIndex {
                    // Save alarm
                    lnManager
                        .alarmViewModels[currentAlarmIndex] = alarmModel
                } else {
                    lnManager
                        .safeAppend(localNotification: alarmModel)
                }
                
                // Schedule alarm
                Task {
                    if alarmModel.alarmEnabled {
                        await lnManager
                            .schedule(localNotification: alarmModel)
                    } else {
                        lnManager.removeRequest(id: alarmModel.id)
                    }
                }
                
                self.presentation
                    .wrappedValue
                    .dismiss()
            }, label: {
                Text("Save")
            })
        }
    }
}

struct CancelSaveAlarm_Previews: PreviewProvider {
    static var previews: some View {
        CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
            .environmentObject(LocalNotificationManager())
    }
}
