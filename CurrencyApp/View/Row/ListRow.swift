//
//  ListRow.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import SwiftUI
import FlagKit

struct ListRow: View {
    var item : CurrencyModel
    
    var body: some View {
        HStack {
            Image(uiImage: setCountryFlag(data: item.currencyName))
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.leading, 8)
                
            VStack(alignment: .leading, spacing: 2) {
                Text(setCurrencyRate(data: item.currencyName))
                    .foregroundColor(setDifferenceChangesColor(diff: item.difference))
                HStack {
                    Text((String(format: "%.3f", 1 / item.currencyRate)))
                        .foregroundColor(setDifferenceChangesColor(diff: item.difference))
                    Image(systemName: setDifferenceChangesIcon(diff: item.difference))
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(setDifferenceChangesColor(diff: item.difference))
                }
            }
            
            Spacer()
            
            Button {
                print("butona basıldı")
            } label: {
                Text("Satın al")
                    .frame(width: 75, height: 30, alignment: .center)
            }
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.trailing, 10)
        }
        .frame(width: UIScreen.screenWidth - 50, height: 75, alignment: .center)
        .background(Color("Gray1"))
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0 , leading: 10, bottom: 0, trailing: 10))
        
    }
    
    func setCurrencyRate(data: String) -> String {
        switch data {
        case "AUD":
            return Enums.Currency.AUD.rawValue
        case "EUR":
            return  Enums.Currency.EUR.rawValue
        case "GBP":
            return  Enums.Currency.GBP.rawValue
        case "RUB":
            return Enums.Currency.RUB.rawValue
        case "USD":
            return  Enums.Currency.USD.rawValue
        default:
            return ""
        }
    }
    
    func setDifferenceChangesColor(diff: Double) -> Color {
        return diff > 0 ? Color("Green1") : Color("Red1")
    }
    
    func setDifferenceChangesIcon(diff: Double) -> String {
        return diff > 0 ? "arrow.up" : "arrow.down"
    }
    
    func setCountryFlag(data: String) -> UIImage {
        switch data {
        case "AUD":
            let flag = Flag(countryCode: Enums.CountryCode.AUD.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "EUR":
            let flag = Flag(countryCode: Enums.CountryCode.EUR.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "GBP":
            let flag = Flag(countryCode: Enums.CountryCode.GPB.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "RUB":
            let flag = Flag(countryCode: Enums.CountryCode.RUB.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "USD":
            let flag = Flag(countryCode: Enums.CountryCode.USD.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        default:
            return UIImage()
        }
    }
}
