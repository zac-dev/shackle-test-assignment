//
//  PropertyPrices.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct PropertyPrices {
        static var standard: PropertyPrice {
            PropertyPrice(lead: PropertyPriceLeads.standard,
                          priceMessages: PropertyPriceMessages.standardArray)
        }
        static var cheep: PropertyPrice {
            PropertyPrice(lead: PropertyPriceLeads.cheep,
                          priceMessages: PropertyPriceMessages.standardArray)
        }
        static var expensive: PropertyPrice {
            PropertyPrice(lead: PropertyPriceLeads.expensive,
                          priceMessages: PropertyPriceMessages.standardArray)
        }
    }
}
