//
//  HotelListFilterView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

struct HotelListFilterView: View {
    
    @Binding var filters: HotelSearchRequestFilters
    @State private var lowPrice: CGFloat = 0
    @State private var highPrice: CGFloat = 300
    @State var rating: Int = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            FilterHeaderView()
                .onAppear() {
                    self.lowPrice = CGFloat(filters.price?.min ?? 0)
                    self.highPrice = CGFloat(filters.price?.max ?? 100)
                    rating = (filters.star?.first ?? 0)/10
                }
            
            // Price filter
            PriceFilterView(filters: $filters,
                            lowPriceSliderLocation: $lowPrice,
                            highPriceSliderLocation: $highPrice)
                .padding(.horizontal, GlobalConsts.standardPadding)
            
            // Rating filter
            RatingFilterView(rating: $rating)
                .padding(GlobalConsts.standardPadding)
            Spacer()
            
            // bottom toolbar
            FilterFooterBarView(filters: $filters,
                                lowPrice: $lowPrice,
                                highPrice: $highPrice,
                                rating: $rating)
        }
    }
}

struct HotelListFilterView_Previews: PreviewProvider {
    
    @State static var filters = HotelSearchRequestFilters(price: HotelSearchRequestFilterRange(min: 90, max: 480), minimumStars: 2)
    
    static var previews: some View {
        HotelListFilterView(filters: $filters)
    }
}
