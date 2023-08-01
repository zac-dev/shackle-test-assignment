//
//  HotelDetailView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

struct HotelDetailView: View {
    
    struct DetailConsts {
        static let topImageRadius = 20.0
        static let topImageHeight = 300.0
    }
    @State var hotel: HotelProperty
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (alignment: .leading) {
            AsyncImage(url: hotel.propertyImage.image.url,
                       content: { image in
                image.resizable()
                    .cornerRadius(DetailConsts.topImageRadius)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: DetailConsts.topImageHeight)
            },
                       placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: DetailConsts.topImageHeight)
            })
            
            HotelDescriptionView(hotel: hotel)
                .padding(.horizontal, GlobalConsts.standardPadding)
            Spacer()
        }
        .padding(.top, -5)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(GlobalConsts.backIconName)
                        .frame(width: GlobalConsts.standardIconButtonSize, height: GlobalConsts.standardIconButtonSize)
                        .foregroundColor(.black)
                        .background(Color.appLightGrey)
                        .clipShape(Circle())
                }
            }
        }
    }
}


struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HotelDetailView(hotel: StubData.Hotels.expensive)
        }
    }
}
