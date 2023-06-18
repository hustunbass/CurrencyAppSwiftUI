//
//  HistoryModel.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 17.06.2023.
//

import Foundation
import RealmSwift

class HistoryModel: Object, Identifiable  {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var amount: Double
    @Persisted var priceReceived: Double
    @Persisted var processTitle: String
    @Persisted var processTime: String
    @Persisted var currencyIcon: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
