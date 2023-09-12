//
//  AlarmApp.swift
//  Alarm
//
//  Created by Yery Castro on 29/6/23.
//

import SwiftUI

@main
struct AlarmApp: App {
    @StateObject var lnManager: LocalNotificationManager = LocalNotificationManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
        }
    }
}
