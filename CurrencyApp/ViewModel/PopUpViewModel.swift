//
//  PopUpViewModel.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 16.06.2023.
//

import Foundation
import RealmSwift

class PopUpViewModel: ObservableObject {
    @Published var balance: Double = 0
    
    func getBalance() {
           let realm = try! Realm()
           if let object = realm.objects(BalanceModel.self).first {
               self.balance = object.balance
           }
       }
}
