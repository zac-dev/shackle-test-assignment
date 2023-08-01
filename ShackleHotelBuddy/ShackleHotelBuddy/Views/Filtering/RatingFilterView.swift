//
//  RatingFilterView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 31/07/2023.
//

import SwiftUI

struct RatingFilterView: View {
    
    @Binding var rating: Int
    
    private let maxRating = 5

    private let offImage: Image? = nil
    private let onImage = Image(systemName: "star.fill")

    private let offColor = Color.appLightGrey
    private let onColor = Color.appCyan
    
    var body: some View {
        VStack {
            Text("Minimum rating")
                .fontWeight(.bold)
                .padding(.vertical, GlobalConsts.standardPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack() {
                ForEach(1..<maxRating + 1, id:\.self) { number in
                    image(for: number)
                        .frame(alignment: .leading)
                        .font(.system(size: 20))
                        .foregroundColor(number>rating ? offColor : onColor)
                        .onTapGesture {
                            rating = number
                        }
                }
                Spacer()
            }
        }
    }
    
    private func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}


struct RatingFilterView_Previews: PreviewProvider {
    
    @State static var stars = 3
    
    static var previews: some View {
        VStack {
            Spacer()
            RatingFilterView(rating: $stars)
            Spacer()
        }
        .padding()
    }
}
