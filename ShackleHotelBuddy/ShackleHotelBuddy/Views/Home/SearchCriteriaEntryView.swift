//
//  SearchCriteriaEntryView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import SwiftUI

struct SearchCriteriaEntryView: View {
    
    struct SearchCriteriaConsts {
        static let tableCellWidth = 150.0
        static let tableCellHeight = 44.0
        static let topPadding = 8.0
    }
    
    @Binding var searchCriteria: HotelSearch
    
    @State private var checkInDateString: String =  GlobalConsts.defaultDate
    @State private var checkOutDateString: String = GlobalConsts.defaultDate
    
    @FocusState var isInputActive: Bool
    
    // Check-in date field row
    private var CheckInDateRow: some View {
        HStack {
            HStack {
                Image(GlobalConsts.checkInIconName)
                Text("Check-in date")
            }
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
            
            Divider()
            
            Text(checkInDateString)
                .overlay {
                    DatePicker("Check-out date",
                               selection: $searchCriteria.checkInDate,
                               in: Date()...,
                               displayedComponents: [.date])
                    .blendMode(.destinationOver)
                    .labelsHidden()
                    .foregroundColor(.appGrey)
                    .accentColor(.appCyan)
                    .tint(.appCyan)
                    .onChange(of: searchCriteria.checkInDate) { newValue in
                        let df = DateFormatter()
                        df.dateFormat = GlobalConsts.dateDisplayFormat
                        checkInDateString = df.string(from: searchCriteria.checkInDate)
                    }
                }
                .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
        }
        .frame(height: SearchCriteriaConsts.tableCellHeight)
    }
    
    // Check-out date field row
    private var CheckOutDateRow: some View {
        HStack {
            HStack {
                Image(GlobalConsts.checkOutIconName)
                Text("Check-out date")
            }
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
            
            Divider()
            
            Text(checkOutDateString)
                .overlay {
                    DatePicker("Check-out date",
                               selection: $searchCriteria.checkOutDate,
                               in: searchCriteria.checkInDate...,
                               displayedComponents: [.date])
                    .blendMode(.destinationOver)
                    .labelsHidden()
                    .foregroundColor(.appGrey)
                    .accentColor(.appCyan)
                    .tint(.appCyan)
                    
                    .onChange(of: searchCriteria.checkOutDate) { newValue in
                        let df = DateFormatter()
                        df.dateFormat = GlobalConsts.dateDisplayFormat
                        checkOutDateString = df.string(from: searchCriteria.checkOutDate)
                    }
                }
                .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
        }
        .frame(height: SearchCriteriaConsts.tableCellHeight, alignment: .leading)
    }
    
    // Number of adults row
    private var AdultsRow: some View {
        HStack {
            HStack {
                Image(GlobalConsts.adultIconName)
                Text("Adults")
            }
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
            
            Divider()
            
            TextField(String(),
                      value: $searchCriteria.adultCount,
                      formatter: NumberFormatter())
            .keyboardType(.numberPad)
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
        }
        .frame(height: SearchCriteriaConsts.tableCellHeight, alignment: .leading)
    }
    
    // Number of children row
    private var ChildrenRow: some View {
        HStack {
            HStack {
                Image(GlobalConsts.childrenIconName)
                Text("Children")
            }
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
            
            Divider()
            
            TextField(String(),
                      value: $searchCriteria.childrenCount,
                      formatter: NumberFormatter())
            .keyboardType(.numberPad)
            .focused($isInputActive)
            .frame(width: SearchCriteriaConsts.tableCellWidth, alignment: .leading)
        }
        .frame(height: SearchCriteriaConsts.tableCellHeight, alignment: .leading)
    }
    
    var body: some View {
        VStack {
            Text("Select guests, date and time")
                .lineLimit(nil)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, GlobalConsts.standardPadding)
            VStack {
                // Check-in date field
                CheckInDateRow
                Divider()
                
                // Check-out date field
                CheckOutDateRow
                Divider()
                
                // number of adults
                AdultsRow
                Divider()
                
                // number of children
                ChildrenRow
            }
            .padding(SearchCriteriaConsts.topPadding)
            .background(
                RoundedRectangle(cornerRadius: GlobalConsts.roundedViewRadius,
                                 style: .continuous)
                .fill(.white))
            .foregroundColor(.appGrey)
            .padding(.horizontal, GlobalConsts.standardPadding)
        }
    }
}


struct SearchCriteriaEntryView_Previews: PreviewProvider {
    
    @State static var searchCriteria = HotelSearch(checkInDate: .now,
                                                   checkOutDate: .tomorrow,
                                                   adultCount: 1,
                                                   childrenCount: 0)
    
    static var previews: some View {
        VStack {
            Spacer()
            SearchCriteriaEntryView(searchCriteria: $searchCriteria)
            Spacer()
        }
        .background(Color.brown)
    }
}
