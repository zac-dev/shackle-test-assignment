//
//  HomeHeader.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

fileprivate struct HomeHeaderConsts {
        static let logoImageName = "images/logo"
    static let profileButtonSize = 36.0
}

struct HomeHeaderView: View {
    @State private var showingProfileView: Bool = false
    
    var body: some View {
        
            HStack {
                Image(HomeHeaderConsts.logoImageName)
                    .padding(.leading, GlobalConsts.standardPadding)
                
                Spacer()
                
                Button {
                    showingProfileView.toggle()
                } label: {
                    Image(GlobalConsts.adultIconName)
                        .background(
                            RoundedRectangle(cornerRadius: GlobalConsts.roundedViewRadius,
                                             style: .continuous)
                            .fill(.white)
                            .frame(width: HomeHeaderConsts.profileButtonSize, height: HomeHeaderConsts.profileButtonSize))
                        .foregroundColor(.appGrey)
                        .padding(.trailing, GlobalConsts.standardPadding)
                }
                .sheet(isPresented: $showingProfileView) {
                    ProfileView(showProfileView: $showingProfileView)
                }
            }
            .padding(.top, 56.0)
    }
}


struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HomeHeaderView()
            Spacer()
        }
        .background(Color.brown)
    }
}
