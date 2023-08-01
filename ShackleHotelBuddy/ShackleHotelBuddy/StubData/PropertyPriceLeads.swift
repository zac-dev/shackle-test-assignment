//
//  PropertyPriceLeads.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct PropertyPriceLeads {
        static var standard: PropertyPriceLead {
            PropertyPriceLead(amount: 300.0,
                              currencyInfo: PropertyPriceCurrencyInfos.standard,
                              formatted: "£300.00")
        }
        static var cheep: PropertyPriceLead {
            PropertyPriceLead(amount: 3.0,
                              currencyInfo: PropertyPriceCurrencyInfos.standard,
                              formatted: "£3.00")
        }
        static var expensive: PropertyPriceLead {
            PropertyPriceLead(amount: 3000.0,
                              currencyInfo: PropertyPriceCurrencyInfos.standard,
                              formatted: "£3000.00")
        }
    }
}
