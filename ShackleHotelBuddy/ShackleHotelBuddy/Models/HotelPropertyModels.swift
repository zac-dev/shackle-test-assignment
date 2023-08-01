//
//  HotelPropertyModels.swift.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

struct HotelSearchResult: Decodable {
    let data: HotelSearchResultData
}

struct HotelSearchResultData: Decodable {
    let propertySearch: HotelPropertySearch
}

struct HotelPropertySearch: Decodable {
    let properties: [HotelProperty]
}

struct HotelProperty: Decodable, Identifiable {
    let id: String
    let name: String
    let propertyImage: PropertyImage
    let price: PropertyPrice
    let reviews: PropertyReview
    
    var formattedRating: String {
        let nf = NumberFormatter()
        nf.maximumFractionDigits = 1
        nf.minimumFractionDigits = 1
        return "★\(nf.string(from: NSNumber(value: reviews.score)) ?? "0.0")"
    }
    
    var formattedPrice: String {
        return "\(price.lead.formatted) \(price.priceMessages.first!.value)"
    }
}

struct PropertyPrice: Decodable {
    let lead: PropertyPriceLead
    let priceMessages: [PropertyPriceMessage]
}

struct PropertyPriceLead: Decodable {
    let amount: Double
    let currencyInfo: PropertyPriceCurrencyInfo
    let formatted: String
}
struct PropertyPriceMessage: Decodable {
    let value: String
}

struct PropertyPriceCurrencyInfo: Decodable {
    let code: String
    let symbol: String
}

struct PropertyReview: Decodable {
    let score: Double
    let total: Int
}

struct ImageData: Decodable {
    let url: URL
}


struct PropertyImage: Decodable {
    let image: ImageData
}
