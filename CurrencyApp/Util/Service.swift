//
//  Service.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import Foundation

struct Service {
    static func getLatestCurrency(baseCurrency: String, completion: @escaping(Result<[CurrencyModel],Error>) -> Void)  {
        
        guard let url = URL(string: "\(Constant.baseUrl)?apikey=\(Constant.apiKey)&date_from=\(String().getBeforeYesterdayDay())&date_to=\(String().getYesterdayDay())&base_currency=\(baseCurrency)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, _) in
            
            guard let jsonData = data else {
                print("No data received.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let exchangeRates = try decoder.decode(ExchangeRates.self, from: jsonData)
                let dateStrings = [String().getBeforeYesterdayDay(), String().getYesterdayDay()]
                var exchangeRatesDict: [String: [String: Double]] = [:]
                var currencyArray: [CurrencyModel] = []
                
                for dateString in dateStrings {
                    if let dateData = exchangeRates.data[dateString] {
                        var currencyRates: [String: Double] = [:]

                        for (currencyCode, rate) in [("USD", dateData.USD), ("GBP", dateData.GBP), ("EUR", dateData.EUR), ("AUD", dateData.AUD), ("RUB", dateData.RUB)] {
                            currencyRates[currencyCode] = rate
                        }
                        exchangeRatesDict[dateString] = currencyRates
                        
                    }
                }
                if let rates1 = exchangeRatesDict[dateStrings[0]], let rates2 = exchangeRatesDict[dateStrings[1]] {
                    for currencyCode in ["USD", "GBP", "EUR","AUD","RUB"] {
                        let diff = rates2[currencyCode]! - rates1[currencyCode]!
                        
                        currencyArray.append(CurrencyModel(iconName: currencyCode, currencyName: currencyCode, currencyRate: rates1[currencyCode] ?? 0, difference: diff))
                    }
                    completion(.success(currencyArray))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}
