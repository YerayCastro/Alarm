//
//  TimeModel.swift
//  Alarm
//
//  Created by Yery Castro on 30/6/23.
//

import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
        (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
    }
    
    let id = UUID()
    let hours: Int
    let minutes: Int
}
