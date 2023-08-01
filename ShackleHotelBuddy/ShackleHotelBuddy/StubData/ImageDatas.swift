//
//  ImageDatas.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct ImageDatas {
        static var standard: ImageData {
            ImageData( url: URLs.Images.standard)
        }
        static var taj: ImageData {
            ImageData(url: URLs.Images.taj)
        }
        static var motel: ImageData {
            ImageData(url: URLs.Images.motel)
        }
    }
}
