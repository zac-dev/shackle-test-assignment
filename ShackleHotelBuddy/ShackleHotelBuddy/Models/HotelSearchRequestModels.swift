//
//  HotelSearchRequestModels.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

struct HotelSearchRequestCoordinates: Codable {
    let lat: Double
    let long: Double
}

struct HotelSearchRequestDestination: Codable {
    var regionId: String
    var coordinates: HotelSearchRequestCoordinates
    
    init(regionId: String, lat: Double, long: Double) {
        self.regionId = regionId
        self.coordinates = HotelSearchRequestCoordinates(lat: lat, long: long)
    }
}

struct HotelSearchRequestDate: Codable {
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    init(from date: Date) {
        let components = date.get(.day, .month, .year)
        self.day = components.day!
        self.month = components.month!
        self.year = components.year!
    }
}

struct HotelSearchRequestRoomDescriptor: Codable {
    var adults: Int
    var children: [HotelSearchRequestChildDescriptor]
}

struct HotelSearchRequestChildDescriptor: Codable {
    var age: Int
}

class HotelSearchRequestFilters: Encodable, Equatable {
    static func == (lhs: HotelSearchRequestFilters, rhs: HotelSearchRequestFilters) -> Bool {
        var minPriceSame = false
        var maxPriceSame = false
        if let lhsPrice = lhs.price, let rhsPrice = rhs.price {
            if lhsPrice.min == rhsPrice.min {
                minPriceSame = true
            }
            if lhsPrice.max == rhsPrice.max {
                maxPriceSame = true
            }
        }
        return lhs.star == rhs.star && minPriceSame && maxPriceSame
    }
    
    
    enum CodingKeys: CodingKey {
        case price,
             star
    }
    
    var price: HotelSearchRequestFilterRange?
    var star: [Int]?
    
    init(price: HotelSearchRequestFilterRange? = nil, minimumStars: Int? = nil) {
        self.price = price
        self.star = nil
        setStarWith(minimumStars)
    }
    
    func setStarWith(_ minimumStars: Int? = nil) {
        if let minimumStars = minimumStars, minimumStars > 0 {
            star = []
            stride(from: (minimumStars*10), to: 51, by: 10).forEach { i in
                star?.append(i)
            }
        }
    }
}

struct HotelSearchRequestFilterRange: Codable {
    var min: Int = 0
    var max: Int = 300
}

struct HotelSearchRequest: Encodable {
    var currency: String = "GBP"
    var eapid: Int = 1
    var locale: String = "en_UK"
    var siteId: Int = 300000005
    var destination: HotelSearchRequestDestination = HotelSearchRequestDestination(regionId: "2114", lat: 51.50746, long: -0.127673)
    var checkInDate: HotelSearchRequestDate
    var checkOutDate: HotelSearchRequestDate
    var rooms: [HotelSearchRequestRoomDescriptor]
    var resultsStartingIndex: Int = 0
    var resultsSize: Int = 50
    var sort: String = "PRICE_LOW_TO_HIGH"
    var filters: HotelSearchRequestFilters?
    
    init(_ searchDetails: HotelSearch, filters: HotelSearchRequestFilters? = HotelSearchRequestFilters(price: HotelSearchRequestFilterRange(min: 0, max: 350), minimumStars: 3)) {
        self.checkInDate = HotelSearchRequestDate(from: searchDetails.checkInDate)
        self.checkOutDate = HotelSearchRequestDate(from: searchDetails.checkOutDate)
        let childrenArray: [HotelSearchRequestChildDescriptor] = [HotelSearchRequestChildDescriptor](repeating: HotelSearchRequestChildDescriptor(age: 3),
                                                                                                     count: searchDetails.childrenCount)
        self.rooms = [
            HotelSearchRequestRoomDescriptor(adults: searchDetails.adultCount, children: childrenArray)
        ]
        self.filters = filters
    }
}
