//
//  PopUpView.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 16.06.2023.
//

import SwiftUI
import RealmSwift
import FlagKit

struct PopUpView: View {
    @ObservedResults(BalanceModel.self) var balance
    @ObservedResults(HistoryModel.self) var history
    @ObservedObject var viewModel = ContentViewModel()
    @State var buyCurrency: String
    @State var totalCost: String
    let item: CurrencyModel?
    
    var body: some View {
            
        ScrollView {
            
            VStack(alignment: .center, spacing: 8) {
                Text(setProcessTitle(code: item?.currencyName ?? ""))
                    .frame(height: 75)
                    .font(.system(size: 20).bold())
                
                Spacer()
                
                Image(uiImage: setCurrencyFlag(code: item?.currencyName ?? ""))
                    .resizable()
                    .frame(width: 75,height: 75, alignment: .center)
                HStack(spacing: 2) {
                    Text("₺ " + String(format: "%.2f", 1 / (item?.currencyRate ?? 1)))
                        .font(.system(size: 35).bold())
                    Image(systemName: setDifferenceChangesIcon(diff: item?.difference ?? 0))
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .foregroundColor(setDifferenceChangesColor(diff: item?.difference ?? 0))
            }.padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(setTextFieldTitle(code: item?.currencyName ?? ""))
                HStack {
                    TextField(buyCurrency, text: $buyCurrency)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5).strokeBorder(.gray))
                    Text(setTextFieldCurrencyIcon(code:item?.currencyName ?? ""))
                }
            }
                .padding(.bottom,8)
                .padding([.leading, .trailing], 16)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Toplam Maliyet")
                    HStack {
                        TextField(totalCost, text: $totalCost)
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5).strokeBorder(.gray))
                            .onTapGesture {
                                    if let number = Double(buyCurrency) {
                                        let multipleNumber = number * (1 / (item?.currencyRate ?? 1) )
                                        totalCost = String(format: "%.2f", multipleNumber)
                                    }
                            }
                        Text("₺")
                    }
            }
                .padding(.bottom,50)
                .padding([.leading, .trailing], 16)
            
            Button {
                let historyItem = HistoryModel()
                historyItem.amount = Double(buyCurrency) ?? 0
                historyItem.priceReceived = 1 / (item?.currencyRate ?? 1)
                historyItem.processTitle = setProcessTitle(code: item?.currencyName ?? "")
                historyItem.processTime = getCurrentDate()
                historyItem.currencyIcon = item?.currencyName ?? ""
                $history.append(historyItem)
                print("Satın alma gerçekleştirildi.")
            } label: {
                HStack {
                    Text("Satın Al")
                        .font(.system(size: 17))
                        .padding()
                }
            }
            .frame(height: 50)
            .padding([.leading, .trailing], 125)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(5)
           
        }
    }
    
    func setDifferenceChangesColor(diff: Double) -> Color {
        return diff > 0 ? Color("Green1") : Color("Red1")
    }
    
    func setDifferenceChangesIcon(diff: Double) -> String {
        return diff > 0 ? "arrow.up" : "arrow.down"
    }
    
    func setProcessTitle(code: String) -> String {
        switch code {
        case "AUD":
            return "Avustralya Doları/TL Satın Alma"
        case "USD":
            return "Dolar/TL Satın Alma"
        case "GBP":
            return "Sterlin/TL Satın Alma"
        case "RUB":
            return "Rus Rublesi/TL Satın Alma"
        case "EUR":
            return "Euro/TL Satın Alma"
        default:
            return ""
        }
    }
    
    func setCurrencyFlag(code: String) -> UIImage {
        switch code {
        case "AUD":
            let flag = Flag(countryCode: Enums.CountryCode.AUD.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "USD":
            let flag = Flag(countryCode: Enums.CountryCode.USD.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "GBP":
            let flag = Flag(countryCode: Enums.CountryCode.GPB.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "RUB":
            let flag = Flag(countryCode: Enums.CountryCode.RUB.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        case "EUR":
            let flag = Flag(countryCode: Enums.CountryCode.EUR.rawValue)
            return flag?.image(style: .circle) ?? UIImage()
        default:
            return UIImage()
        }
    }
    
    func setTextFieldTitle(code: String) -> String {
        switch code {
        case "AUD":
            return "Satın almak istediğiniz Avustralya Doları"
        case "USD":
            return "Satın almak istediğiniz Dolar"
        case "GBP":
            return "Satın almak istediğiniz Sterlin"
        case "RUB":
            return "Satın almak istediğiniz Rus Rublesi"
        case "EUR":
            return "Satın almak istediğiniz Euro"
        default:
            return ""
        }
    }
    
    func setTextFieldCurrencyIcon(code: String) -> String {
        switch code {
        case "AUD":
            return "$"
        case "USD":
            return "$"
        case "GBP":
            return "£"
        case "RUB":
            return "руб."
        case "EUR":
            return "€"
        default:
            return ""
        }
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        let now = dateFormatter.string(from: Date())
        return now
    }
    
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(buyCurrency: "", totalCost: "", item: CurrencyModel(iconName: "", currencyName: "", currencyRate: 0, difference: 0))
    }
}
