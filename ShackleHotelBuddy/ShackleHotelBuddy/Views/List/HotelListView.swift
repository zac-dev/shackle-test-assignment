//
//  HotelListView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI
import Combine

struct HotelListView<ModelFetcher>: View where ModelFetcher: HotelInteractable {
    
    @ObservedObject var fetcher: ModelFetcher
    @Binding var search: HotelSearch
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            if fetcher.hotels.isEmpty {
                ProgressView()
            } else {
                List(fetcher.hotels) { hotel in
                    HotelCellView(hotel: hotel)
                }
                .listStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Search")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(GlobalConsts.backIconName)
                        .frame(width: GlobalConsts.standardIconButtonSize, height: GlobalConsts.standardIconButtonSize)
                        .foregroundColor(.black)
                        .background(SwiftUI.Color.appLightGrey)
                        .clipShape(SwiftUI.Circle())
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: HotelListFilterView(filters: $fetcher.filters)) {
                    Image(GlobalConsts.filterIconName)
                        .frame(width: GlobalConsts.standardIconButtonSize, height: GlobalConsts.standardIconButtonSize)
                        .foregroundColor(.black)
                        .background(Color.appLightGrey)
                        .clipShape(Circle())
                }
            }
        }
        .onChange(of: fetcher.filters,
                  perform: { newValue in
            Task {
                await fetcher.fetch(search)
            }
        })
    }
}


struct HotelListView_Previews: PreviewProvider {
    
    @StateObject static var fetcher = FakeHotelInteractor(hotels: StubData.Hotels.standardArray, filters: HotelSearchRequestFilters())
    @State static var search = StubData.HotelSearchs.standard
    
    static var previews: some View {
        NavigationView {
            HotelListView(fetcher: fetcher,
                          search: $search)
        }
    }
}
