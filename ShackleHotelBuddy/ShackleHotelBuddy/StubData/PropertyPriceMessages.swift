//
//  PropertyPriceMessages.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct PropertyPriceMessages {
        static var standard: PropertyPriceMessage {
            PropertyPriceMessage(value: "night")
        }
        static var hourly: PropertyPriceMessage {
            PropertyPriceMessage(value: "week")
        }
        static var annualy: PropertyPriceMessage {
            PropertyPriceMessage(value: "month")
        }
        
        static var standardArray: [PropertyPriceMessage] {
            [standard, hourly, annualy]
        }
    }
}
