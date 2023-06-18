//
//  BalanceModel.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 16.06.2023.
//

import Foundation
import RealmSwift

class BalanceModel: Object, Identifiable  {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var balance : Double
    
    override class func primaryKey() -> String? {
        "id"
    }
}
