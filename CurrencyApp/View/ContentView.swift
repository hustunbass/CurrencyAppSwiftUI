//
//  ContentView.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
            HStack(alignment: .center) {
                Text("500 TL")
                Image(systemName: "house")
                Button {
                    print("basıldı")
                } label: {
                    Image(systemName: "arrow.down")
                }
            }
            Spacer()
            List {
                Section {
                    Text("")
                }header: {
                    Text("Para Birimleri")
                }
            }.foregroundColor(.black)
            Spacer()
            Button("Satın al") {
                print("satın alındı")
            }
            .background(.black)
            .foregroundColor(.white)
            .padding()
            .frame(width: 230, height: 50,alignment: .leading)
            
            Button("Geçmiş Hareketler") {
                print("basıldı")
            }.frame(width:200, height: 50, alignment: .center)
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
