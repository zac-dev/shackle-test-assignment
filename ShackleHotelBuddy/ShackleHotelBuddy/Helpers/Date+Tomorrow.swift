//
//  Date+Tomorrow.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension Date {
    static var tomorrow: Date {
        return Date(timeIntervalSinceNow: 60*60*24)
    }
}
