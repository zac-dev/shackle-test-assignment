//
//  HotelDescriptionView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

struct HotelDescriptionView: View {
    
    var hotel: HotelProperty
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(hotel.name)
                    .font(.callout)
                    .fontWeight(.bold)
                Spacer()
                Text(hotel.formattedRating)
                    .font(.callout)
            }
            Text("London, England")
                .font(.callout)
                .foregroundColor(.appLightGrey)
            Text(hotel.formattedPrice)
                .font(.caption)
                .padding(.bottom, GlobalConsts.standardPadding)
        }
    }
}


struct HotelDescriptionView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Spacer()
            HotelDescriptionView(hotel: StubData.Hotels.standard)
            Spacer()
        }
        .padding()
    }
}
