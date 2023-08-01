//
//  HotelCellView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

fileprivate struct ListConsts {
    static let cellImageHeights = 350.0
}

struct HotelCellView: View {
    
    var hotel: HotelProperty
    
    var body: some View {
        ZStack {
            NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                EmptyView()
            }
            VStack (alignment: .leading) {
                AsyncImage(url: hotel.propertyImage.image.url,
                           content: { image in
                    image
                        .resizable()
                        .cornerRadius(GlobalConsts.roundedViewRadius)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,
                               maxHeight: ListConsts.cellImageHeights)
                },
                           placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: ListConsts.cellImageHeights)
                })
                HotelDescriptionView(hotel: hotel)
            }
            .listRowSeparator(.hidden)
        }
    }
}


struct HotelCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Spacer()
            HotelCellView(hotel: StubData.Hotels.standard)
            Spacer()
        }
        .padding()
    }
}
