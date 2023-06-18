//
//  ContentView.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import SwiftUI
import FlagKit
import RealmSwift

struct ContentView: View {
    @ObservedResults(BalanceModel.self) var balance
    @ObservedObject var viewModel = ContentViewModel()
    @State var openPage: Bool = false
    @State var selectedItem: CurrencyModel?
    
    var body: some View {
        NavigationView {
            NavigationStack {
                VStack(alignment: .leading) {
                    Text("Merhaba, Onur Çağlar!")
                        .font(.custom("Helvatica-Neue", size: 15))
                        .foregroundColor(Color("Gray2"))
                        .padding(16)
                    VStack(alignment: .center){
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text("₺ " + String(format: "%.2f", viewModel.balance))
                                .font(.custom("Helvatica-Neue-Medium", size: 30))
                            Image(uiImage: setBaseCurrencyImage())
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                            Button {
                                print("basıldı")
                            } label: {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }.padding(1)
                        HStack(spacing: 4) {
                            Text("Cüzdan ID: 5221476")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Gray3"))
                            Button {
                                print("Copy tıklandı")
                            } label: {
                                Image(uiImage: UIImage(named: "copy") ?? UIImage())
                                    .resizable()
                                    .frame(width: 12, height: 12, alignment: .center)
                            }
                            .foregroundColor(.black)
                        }
                    }.padding()
                    
                    Spacer()
                    
                    List {
                        Section(header: Text("Para Birimleri")) {
                            ForEach(viewModel.currencyArray) { item in
                                NavigationLink.init(destination: PopUpView(buyCurrency: "", totalCost: "", item: item)) {
                                    ListRow.init(item: item)
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onAppear(perform: {
                        DispatchQueue.main.async {
                            viewModel.getCurrency(baseCurrency: "TRY")
                        }
                    })
                    .lineSpacing(2)
                    .frame(width: UIScreen.screenWidth)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Button {
                            if balance.isEmpty {
                                let balance = BalanceModel()
                                balance.balance = randomBalance()
                                $balance.append(balance)
                            } else {
                                viewModel.updateBalance(newBalance: viewModel.balance + randomBalance())
                            }
                            
                        } label: {
                            HStack {
                                Text("Para Ekle")
                                    .padding()
                                Spacer()
                                Image(uiImage: UIImage(named: "plus") ?? UIImage())
                                    .frame(width: 25,height: 25, alignment: .center)
                                    .padding()
                            }
                            
                        }
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .frame(height: 45)
                        .padding(EdgeInsets(top: 15 , leading: 30, bottom: 0, trailing: 5))
                        
                        Button {
                            print("Geçmiş İşlemler sayfasına git. TO DO")
                        } label: {
                            HStack {
                                Text("Geçmiş İşlemler")
                                
                                    .padding()
                                
                                Spacer()
                                Image(uiImage: UIImage(named: "history") ?? UIImage())
                                    .frame(width: 25,height: 25, alignment: .center)
                                    .padding()
                            }
                        }
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .frame(height: 45)
                        .padding(EdgeInsets(top: 8 , leading: 30, bottom: 0, trailing: 5))
                        
                    }.onAppear {
                        viewModel.getBalance()
                    }
                }
                .padding()
            }
        }
        
    }
    
    func setBaseCurrencyImage() -> UIImage {
        let flag = Flag(countryCode: "TR")
        return flag?.image(style: .circle) ?? UIImage()
    }
    
    func randomBalance() -> Double {
        let random = Double.random(in: 500..<1000)
        return random
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
