//
//  PropertyReviews.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct PropertyReviews {
        static var standard: PropertyReview {
            PropertyReview(score: 2.5, total: 50)
        }
        static var bad: PropertyReview {
            PropertyReview(score: 0.2, total: 5)
        }
        static var good: PropertyReview {
            PropertyReview(score: 4.9, total: 500)
        }
    }
}
