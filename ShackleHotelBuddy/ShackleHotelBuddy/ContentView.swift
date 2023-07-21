//
//  ContentView.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("images/logo")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Good luck!")
        }
        .ignoresSafeArea()
        .padding()
        .background(Color("color/grey"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
