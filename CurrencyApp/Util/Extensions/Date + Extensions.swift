//
//  Date + Extensions.swift
//  CurrencyExchangeApp
//
//  Created by Hakan Ustunbas on 11.06.2023.
//

import Foundation
    extension Date {
        static var yesterday: Date { return Date().dayBefore }
        var dayBefore: Date {
            return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
        }
        var dayBeforeYesterday: Date {
            return Calendar.current.date(byAdding: .day, value: -3, to: noon)!
        }
        var noon: Date {
               return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
           }
    }

