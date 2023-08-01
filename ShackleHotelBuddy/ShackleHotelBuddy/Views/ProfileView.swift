//
//  ProfileView.swift
//  ShackleHotelBuddy
//
//  Created by Zachary Burgess on 30/07/2023.
//

import Foundation

import SwiftUI

struct ProfileView: View {
    
    @Binding var showProfileView: Bool

    var body: some View {
        NavigationView {
            VStack {
                Image(GlobalConsts.logoImageName)
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Good luck!")
            }
            .ignoresSafeArea()
            .padding()
            .background(Color.appGrey)
            .navigationBarTitle(Text("Profile"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showProfileView = false
            }) {
                Text("Done").bold()
            })
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        ProfileView(showProfileView: $value)
    }
}
