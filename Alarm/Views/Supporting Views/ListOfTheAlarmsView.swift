//
//  ListOfTheAlarmsView.swift
//  Alarm
//
//  Created by Yery Castro on 3/7/23.
//

import SwiftUI

struct ListOfTheAlarmsView: View {
    
//    var alarmViewModels: [AlarmModel]
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State var isActive = false
    @State var currentIndex: Int? = nil
    @State var addEditViewType: AddEditViewType = .standard
//    @State var addEditViewType: AddEditViewType = .circular

    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                            
                            AlarmRowViewButton(model: lnManager
                                .alarmViewModels[i], i: i,
                           currentIndex: $currentIndex,
                           isActive: $isActive
                            )
                            .padding(.vertical)
                            
                            
                        }
                        .onDelete(perform: deleteMe)
                    }
                    
                    SelectView(width: 50, addEditViewType: $addEditViewType, isActive: $isActive)
                    
                }
                
                FourCoolCircles()
                    .opacity(0.3)

        }
            .navigationTitle("Alarm List")
            .sheet(
                isPresented: $isActive,
                onDismiss: {}) {
                    // Edit the currentIndex alarm
                    ChooseAlarmView(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
                }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        isActive.toggle()
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(black)
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
        }
        }
    }
    
    func deleteMe(offsets: IndexSet) {
        // Remove from pending alarms
        for index in offsets {
            print("Remove request from \(lnManager.alarmViewModels[index].id)")
            lnManager
                .removeRequest(
                    id: lnManager.alarmViewModels[index].id
                )
            
        }
        
        // Removing from alarmViewModels
        lnManager.alarmViewModels.remove(atOffsets: offsets)
        
    }
}

struct ListOfTheAlarmsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTheAlarmsView()
            .environmentObject(LocalNotificationManager())
    }
}
