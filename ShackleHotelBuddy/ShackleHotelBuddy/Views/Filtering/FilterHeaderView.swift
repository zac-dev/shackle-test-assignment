//
//  FilterHeaderView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 31/07/2023.
//

import SwiftUI

struct FilterHeaderView: View {
    
    struct FilterHeaderConsts {
        static let barHeight = 55.0
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("Filters")
                    .fontWeight(.thin)
                    .frame(minHeight: FilterHeaderConsts.barHeight)
                    .padding(.vertical, GlobalConsts.standardPadding)
                Divider()
            }
            .frame(minHeight: FilterHeaderConsts.barHeight, alignment: .center)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(GlobalConsts.backIconName)
                        .frame(width: GlobalConsts.standardIconButtonSize, height: GlobalConsts.standardIconButtonSize)
                        .foregroundColor(.black)
                        .background(Color.appLightGrey)
                        .clipShape(Circle())
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal, GlobalConsts.standardPadding)
                Spacer()
            }
            .frame(minHeight: FilterHeaderConsts.barHeight, alignment: .center)
        }
        .frame(minHeight: FilterHeaderConsts.barHeight)
    }
}


struct FilterHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FilterHeaderView()
            Spacer()
        }
        .background(Color.brown)
    }
}
