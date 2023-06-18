//
//  TabBarView.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Ana Sayfa",image: "tabBar_home_fill")
                }
        }.background(Color.gray)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
