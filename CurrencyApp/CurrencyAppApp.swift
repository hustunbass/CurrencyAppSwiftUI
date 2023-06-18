//
//  CurrencyAppApp.swift
//  CurrencyApp
//
//  Created by Hakan Ustunbas on 15.06.2023.
//

import SwiftUI

@main
struct CurrencyAppApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path)
            TabBarView()
        }
    }
}
