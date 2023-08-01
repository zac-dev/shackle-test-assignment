//
//  Hotels.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct Hotels {
        static var standard: HotelProperty {
            return HotelProperty(id: "12345",
                                 name: "Standard Hotel Name",
                                 propertyImage: PropertyImages.standard,
                                 price: PropertyPrices.standard,
                                 reviews: PropertyReviews.standard)
        }
        
        static var cheep: HotelProperty {
            return HotelProperty(id: "54321",
                                 name: "Cheepy Mc Cheep Hotel",
                                 propertyImage: PropertyImages.motel,
                                 price: PropertyPrices.cheep,
                                 reviews: PropertyReviews.bad)
        }
        
        static var expensive: HotelProperty {
            return HotelProperty(id: "98765",
                                 name: "Taj Mahal Hotel",
                                 propertyImage: PropertyImages.taj,
                                 price: PropertyPrices.expensive,
                                 reviews: PropertyReviews.good)
        }
        static var standardArray: [HotelProperty] {
            [expensive, standard, cheep]
        }
    }
}
