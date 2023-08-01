//
//  PropertyImages.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct PropertyImages {
        static var standard: PropertyImage {
            PropertyImage(image: ImageDatas.standard)
        }
        static var taj: PropertyImage {
            PropertyImage(image: ImageDatas.taj)
        }
        static var motel: PropertyImage {
            PropertyImage(image: ImageDatas.motel)
        }
    }
}
