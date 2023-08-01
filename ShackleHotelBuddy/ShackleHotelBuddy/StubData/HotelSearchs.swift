//
//  HotelSearchs.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct HotelSearchs {
        static var standard: HotelSearch {
            return HotelSearch(checkInDate: .now,
                               checkOutDate: .tomorrow,
                               adultCount: 1,
                               childrenCount: 0)
        }
        
        static var family: HotelSearch {
            return HotelSearch(checkInDate: .now,
                               checkOutDate: .tomorrow,
                               adultCount: 2,
                               childrenCount: 2)
        }
        
        static var manyAdults: HotelSearch {
            return HotelSearch(checkInDate: .now,
                               checkOutDate: .tomorrow,
                               adultCount: 4,
                               childrenCount: 0)
        }
        static var standardArray: [HotelSearch] {
            [manyAdults, standard, family]
        }
    }
}
