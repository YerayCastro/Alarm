//
//  MainAddEditAlarmView.swift
//  Alarm
//
//  Created by Yery Castro on 3/7/23.
//

import SwiftUI

struct MainAddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex,
                 alarmModel: alarmModel)
                .tag("One")
            
            AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex,
                 alarmModel: alarmModel)
                .tag("Two")
        }
        .onAppear() {
            UIPageControl
                .appearance()
                .currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct MainAddEditAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
