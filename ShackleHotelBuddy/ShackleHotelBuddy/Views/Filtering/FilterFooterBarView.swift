//
//  FilterFooterBarView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 31/07/2023.
//

import SwiftUI

struct FilterFooterBarView: View {
    
    @Binding var filters: HotelSearchRequestFilters
    @Binding var lowPrice: CGFloat
    @Binding var highPrice: CGFloat
    @Binding var rating: Int
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .tint(.clear)
                Spacer()
                Button {
                    if filters.price == nil {
                        filters.price = HotelSearchRequestFilterRange(min:Int(lowPrice),
                                                                      max: Int(highPrice))
                    }
                    filters.price?.min = Int(lowPrice)
                    filters.price?.max = Int(highPrice)
                    filters.setStarWith(rating)
                    dismiss()
                } label: {
                    Text("Apply filters")
                        .padding(.vertical, 8.0)
                        .padding(.horizontal, GlobalConsts.standardPadding)
                }
                .tint(.appCyan)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, GlobalConsts.standardPadding)

        }
    }
}


struct FilterFooterBarView_Previews: PreviewProvider {
    
    @State static var filters = HotelSearchRequestFilters(price: HotelSearchRequestFilterRange(min: 90, max: 480), minimumStars: 2)
    @State static var low = CGFloat(0.0)
    @State static var high = CGFloat(300.0)
    @State static var stars = 3
    
    static var previews: some View {
        VStack {
            Spacer()
            FilterFooterBarView(filters: $filters,
                                lowPrice: $low,
                                highPrice: $high,
                                rating: $stars)
        }
    }
}
