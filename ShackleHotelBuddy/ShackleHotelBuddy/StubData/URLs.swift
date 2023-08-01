//
//  URLs.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

extension StubData {
    struct URLs {
        static var standard: URL {
            URL(string: "https://www.google.com")!
        }
        
        struct Images {
            static var standard: URL {
                URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Cecil_Hotel%2C_L.A.jpg/1200px-Cecil_Hotel%2C_L.A.jpg")!
            }
            static var taj: URL {
                URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Mumbai_Aug_2018_%2843397784544%29.jpg/1920px-Mumbai_Aug_2018_%2843397784544%29.jpg")!
            }
            static var motel: URL {
                URL(string: "https://wpde.com/resources/media2/original/full/1280/center/80/49f3afe8-50ab-42ac-a35c-f6816feb92a5-thumb_864.png")!
            }
        }
    }
}
