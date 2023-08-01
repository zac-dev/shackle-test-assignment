//
//  SearchHistoryTable.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

fileprivate struct SearchHistoryConsts {
    static let height = 44.0
    static let iconPadding = 10.0
}

struct SearchHistoryTable<ModelFetcher>: View where ModelFetcher: HotelInteractable {
    
    @ObservedObject var fetcher: ModelFetcher
    @Binding var search: HotelSearch
    
    var body: some View {
        VStack {
            Text("Search history")
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity ,alignment: .leading)
            Group {
                ForEach(fetcher.searches, id: \.self) { search in
                    NavigationLink(destination: HotelListView(fetcher: fetcher, search: $search)) {
                        HStack {
                            Image(GlobalConsts.historyIconName)
                                .renderingMode(.template)
                                .padding(.leading, SearchHistoryConsts.iconPadding)
                                .foregroundColor(.appCyan)
                            Divider()
                            Text(search.description)
                                .font(.system(size: SearchHistoryConsts.iconPadding))
                                .foregroundColor(.appGrey)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: SearchHistoryConsts.height)
                        .background(RoundedRectangle(cornerRadius: GlobalConsts.roundedViewRadius,
                                                     style: .continuous)
                            .fill(.white))
                    }
                }
            }
        }
        .padding(.horizontal, GlobalConsts.standardPadding)
    }
}


struct SearchHistoryTable_Previews: PreviewProvider {
    
    @StateObject static var fetcher = FakeHotelInteractor(hotels: StubData.Hotels.standardArray,
                                                          searches: StubData.HotelSearchs.standardArray, filters: HotelSearchRequestFilters())
    @State static var search = StubData.HotelSearchs.standard
    
    static var previews: some View {
        VStack {
            Spacer()
            SearchHistoryTable(fetcher: fetcher, search: $search)
            Spacer()
        }
        .background(Color.brown)
    }
}
