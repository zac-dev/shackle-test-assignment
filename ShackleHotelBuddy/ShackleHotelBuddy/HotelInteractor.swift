//
//  HotelInteractor.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation
import Combine

protocol HotelInteractable: ObservableObject {
    var hotels: [HotelProperty] { get }
    var searches: [HotelSearch] { get }
    var filters: HotelSearchRequestFilters { get set }
    
    func fetch(_ searchData: HotelSearch) async
}

final class HotelInteractor: HotelInteractable, ObservableObject {
    
    @Published private(set) var hotels: [HotelProperty] = []
    @Published private(set) var searches: [HotelSearch] = []
    @Published var filters = HotelSearchRequestFilters()
    
    func fetch(_ searchData: HotelSearch) async {
        let url = URL(string: "https://hotels4.p.rapidapi.com/properties/v2/list")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "X-RapidAPI-Key": "62878bfc71mshb6e106f3812ecdcp1d6af3jsnadb0875b2a27", // "cc72f136a8msh018f48d73a78137p175bf4jsn7a5565edbf53",
            "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
        ]
        let requestObject = HotelSearchRequest(searchData, filters: filters)
        request.httpBody = try? JSONEncoder().encode(requestObject)
    
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedResponse = try JSONDecoder().decode(HotelSearchResult.self, from: data)
            DispatchQueue.main.async {
                self.searches = [searchData]
                self.hotels = decodedResponse.data.propertySearch.properties
            }
        } catch {
            print("Error \(String(describing: error.localizedDescription))")
        }
    }
}


// For testing and previews
final class FakeHotelInteractor: HotelInteractable, ObservableObject {
    
    @Published private(set) var hotels: [HotelProperty] = []
    @Published private(set) var searches: [HotelSearch] = []
    @Published var filters = HotelSearchRequestFilters()
    
    init(hotels: [HotelProperty] = [], searches: [HotelSearch] = [], filters: HotelSearchRequestFilters) {
        self.hotels = hotels
        self.searches = searches
        self.filters = filters
        self._fetchNewResult = hotels
    }
    
    // test variables for load (underscored for easy visibility)
    var _fetchCallCount: Int = 0
    var _fetchSearchData: HotelSearch? = nil
    var _fetchNewResult: [HotelProperty] = [] // during test set hotels here to show changes over time.
    
    func fetch(_ searchData: HotelSearch) {
        _fetchCallCount += 1
        _fetchSearchData = searchData
        self.hotels = _fetchNewResult
    }
}
