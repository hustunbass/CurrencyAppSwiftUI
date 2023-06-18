//
//  String + Extensions.swift
//  CurrencyExchangeApp
//
//  Created by Hakan Ustunbas on 11.06.2023.
//

import Foundation
import UIKit

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func getYesterdayDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let yesterdayDate = formatter.string(from: Date().dayBefore)
        return yesterdayDate
    }
    
    func getBeforeYesterdayDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dayBeforeYesterday = formatter.string(from: Date().dayBeforeYesterday)
        return dayBeforeYesterday
    }
}
