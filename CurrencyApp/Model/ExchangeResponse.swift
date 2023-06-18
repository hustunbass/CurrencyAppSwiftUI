//
//  ExchangeResponse.swift
//  CurrencyExchangeApp
//
//  Created by Hakan Ustunbas on 13.06.2023.
//

import Foundation

import Foundation

struct ExchangeRates: Decodable {
    let data: [String: DateData]
}

struct DateData: Decodable {
    let AUD: Double
    let EUR: Double
    let GBP: Double
    let RUB: Double
    let TRY: Double
    let USD: Double
}
