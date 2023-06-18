//
//  CurrencyModel.swift
//  CurrencyExchangeApp
//
//  Created by Hakan Ustunbas on 11.06.2023.
//

import Foundation

class CurrencyModel: ObservableObject, Identifiable {
    @Published var iconName: String
    @Published var currencyName: String
    @Published var currencyRate: Double
    @Published var difference: Double
    
    init(iconName: String, currencyName: String, currencyRate: Double, difference: Double) {
          self.iconName = iconName
          self.currencyName = currencyName
          self.currencyRate = currencyRate
          self.difference = difference
      }
}


