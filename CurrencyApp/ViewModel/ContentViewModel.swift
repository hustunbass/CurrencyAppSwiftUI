//
//  ContentViewModel.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import Foundation
import RealmSwift

class ContentViewModel: ObservableObject {
    @Published var currencyArray = [CurrencyModel]()
    @Published var balance: Double = 0
    
    func `init`() {
        getCurrency(baseCurrency: "")
    }
    
    func getBalance() {
           let realm = try! Realm()
           if let object = realm.objects(BalanceModel.self).first {
               self.balance = object.balance
           }
       }
       
       func updateBalance(newBalance: Double) {
           let realm = try! Realm()
           if let objectToUpdate = realm.objects(BalanceModel.self).first {
               try! realm.write {
                   objectToUpdate.balance = newBalance
               }
               self.getBalance() // güncellenmiş bakiyeyi tekrar almak için
           }
       }
    
    func getCurrency(baseCurrency: String) {
        Service.getLatestCurrency(baseCurrency: baseCurrency) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.currencyArray = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
