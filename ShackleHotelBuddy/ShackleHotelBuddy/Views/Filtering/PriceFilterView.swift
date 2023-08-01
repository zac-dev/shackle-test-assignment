//
//  PriceFilterView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 31/07/2023.
//

import RangeUISlider
import SwiftUI

struct PriceFilterView: View {
    
    struct PriceFilterConsts {
        static let rangeValueTextWidth = 50.0
        static let viewHeight = 44.0
        static let textBorderWidth = 1.0
    }
    
    @Binding var filters: HotelSearchRequestFilters
    @Binding var lowPriceSliderLocation: CGFloat
    @Binding var highPriceSliderLocation: CGFloat
    
    private var lowPrice: Int {
        Int(lowPriceSliderLocation)
    }
    private var lowPriceFormatted: String { "\(lowPrice)" }
    
    private var highPrice: Int {
        Int(highPriceSliderLocation)
    }
    private var highPriceFormatted: String { "\(highPrice)" }
    var body: some View {
        VStack {
            Text("Price range")
                .fontWeight(.bold)
                .padding(.vertical, GlobalConsts.standardPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .center) {
                Text(lowPriceFormatted)
                    .frame(width: PriceFilterConsts.rangeValueTextWidth)
                    .foregroundColor(.gray)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: GlobalConsts.roundedViewRadius)
                            .stroke(.gray, lineWidth: PriceFilterConsts.textBorderWidth)
                    )
                RangeSlider(minValueSelected: $lowPriceSliderLocation, maxValueSelected: $highPriceSliderLocation)
                    .barHeight(6)
                    .barCorners(3)
                
                    .stepIncrement(10)
                
                    .defaultValueLeftKnob(lowPriceSliderLocation)
                    .defaultValueRightKnob(highPriceSliderLocation)
                
                    .scaleMinValue(0)
                    .scaleMaxValue(750)
                
                    .rangeSelectedColor(.appCyan)
                
                    .leftKnobWidth(30)
                    .leftKnobHeight(30)
                    .leftKnobCorners(15)
                    .leftKnobColor(.white)
                    .leftKnobBorderColor(.gray)
                    .leftKnobBorderWidth(1)
                
                    .rightKnobWidth(30)
                    .rightKnobHeight(30)
                    .rightKnobCorners(15)
                    .rightKnobColor(.white)
                    .rightKnobBorderColor(.gray)
                    .rightKnobBorderWidth(1)
                Text(highPriceFormatted)
                    .frame(width: PriceFilterConsts.rangeValueTextWidth)
                    .foregroundColor(.gray)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: GlobalConsts.roundedViewRadius)
                            .stroke(.gray, lineWidth: PriceFilterConsts.textBorderWidth)
                    )
            }
            .frame(maxHeight: PriceFilterConsts.viewHeight, alignment: .center)
        }
    }
}


struct PriceFilterView_Previews: PreviewProvider {
    
    @State static var filters = HotelSearchRequestFilters(price: HotelSearchRequestFilterRange(min: 90, max: 480), minimumStars: 2)
    @State static var low = CGFloat(0.0)
    @State static var high = CGFloat(300.0)
    
    static var previews: some View {
        VStack {
            Spacer()
            PriceFilterView(filters: $filters,
                            lowPriceSliderLocation: $low,
                            highPriceSliderLocation: $high)
            Spacer()
        }
        .padding()
    }
}
