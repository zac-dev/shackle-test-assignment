//
//  ContentView.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

fileprivate struct HomeConsts {
    static let backgroundImageName = "images/background"
    static let profileButtonSize = 36.0
    static let searchButtonHeight = 44.0
}

struct HomeView<ModelFetcher>: View where ModelFetcher: HotelInteractable {
    
    @ObservedObject var fetcher: ModelFetcher
    @Binding var searchCriteria: HotelSearch
    
    @State private var showingProfileView: Bool = false
    
    private var isSearchValid: Bool {
        // checkInDate is in future
        let validCheckIn = searchCriteria.checkInDate.compare(.now) == .orderedDescending
        // checkoutdate is at least a day in the future of chckInDate
        let validCheckOut = searchCriteria.checkOutDate.compare(searchCriteria.checkInDate) == .orderedDescending
        // at least 1 guest
        let validGuestCount = searchCriteria.adultCount >= 1
        return validCheckIn && validCheckOut && validGuestCount
    }
    
    private var hasHistory: Bool {
        !fetcher.searches.isEmpty
    }
    
    private var header: some View {
        HStack {
            Image(GlobalConsts.logoImageName)
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
                        .frame(width: HomeConsts.profileButtonSize, height: HomeConsts.profileButtonSize))
                    .foregroundColor(.appGrey)
                    .padding(.trailing, GlobalConsts.standardPadding)
            }
            .sheet(isPresented: $showingProfileView) {
                ProfileView(showProfileView: $showingProfileView)
            }
        }
        .padding(.top, 56.0)}
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(HomeConsts.backgroundImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                // Header
                VStack {
                    HomeHeaderView()
                    Spacer()
                }
                
                // Body
                VStack {
                    Spacer()
                    SearchCriteriaEntryView(searchCriteria: $searchCriteria)
                    if hasHistory {
                        SearchHistoryTable(fetcher: fetcher, search: $searchCriteria)
                            .padding(.top, 16.0)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Footer
                VStack {
                    Spacer()
                    NavigationLink(destination: HotelListView(fetcher: fetcher,
                                                              search: $searchCriteria)) {
                        Text("Search")
                            .frame(maxWidth: .infinity, minHeight: HomeConsts.searchButtonHeight)
                            .foregroundColor(.white)
                    }
                                                              .tint(.appCyan)
                                                              .buttonStyle(.borderedProminent)
                                                              .padding(.horizontal, GlobalConsts.standardPadding)
                                                              .padding(.bottom, 32.0)
                                                              .disabled(!isSearchValid)
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    
    @StateObject static var fetcher = FakeHotelInteractor(hotels: StubData.Hotels.standardArray, searches: [StubData.HotelSearchs.standard], filters: HotelSearchRequestFilters())
    @State static var searchCriteria = HotelSearch(checkInDate: .now,
                                                   checkOutDate: .tomorrow,
                                                   adultCount: 1,
                                                   childrenCount: 0)
    
    static var previews: some View {
        HomeView(fetcher: fetcher, searchCriteria: $searchCriteria)
    }
}
