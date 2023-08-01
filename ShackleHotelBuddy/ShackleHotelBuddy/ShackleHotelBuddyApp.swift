//
//  ShackleHotelBuddyApp.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

@main
struct ShackleHotelBuddyApp: App {
    
    @StateObject var fetcher = HotelInteractor()
    @State var searchCriteria = HotelSearch(checkInDate: .now,
                                            checkOutDate: .tomorrow,
                                            adultCount: 1,
                                            childrenCount: 0)
    
    var body: some Scene {
        WindowGroup {
            HomeView(fetcher: fetcher, searchCriteria: $searchCriteria)
        }
    }
}
