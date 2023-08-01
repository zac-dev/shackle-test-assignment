//
//  HotelSearch.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

struct HotelSearch: Identifiable, Hashable, Codable {
    var id = UUID()
    var checkInDate: Date
    var checkOutDate: Date
    var adultCount: Int
    var childrenCount: Int
    
    var description: String {
        let df = DateFormatter()
        df.dateFormat = "dd / MM / YYYY"
        return "\(df.string(from: checkInDate)) - \(df.string(from: checkInDate)) \(adultCount) adults, \(childrenCount) children"
    }
}
