//
//  AlcoholLevel.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI
import Foundation
import Combine

class AppData: ObservableObject {
    @Published var alcoholRate: Double = 0.00
    @Published var multiplicator: Int = 1
    
    private let defaults = UserDefaults.standard

    func calculateAlcoholRate(user: UserInfos, alcohol: Alcohol, quantityInCL: Double) -> Double {
        let quantityInML = quantityInCL * 10
        let pureAlcoholVolume = quantityInML * (Double(alcohol.percentage) ?? 0) / 100.0
        let pureAlcoholGrams = pureAlcoholVolume * 0.789
        print(user.gender, user.size, user.weight)
        let r = user.gender.lowercased() == "homme" ? 0.68 : 0.55
        let weightInGrams = Double(user.weight) * 1000
        let alcoholRate = (pureAlcoholGrams / (weightInGrams * r)) * 1000
        return alcoholRate
    }

    func calculateCurrentAlcoholRate(user: UserInfos, alcohol: Alcohol, quantityInCL: Double, consumptionTime: Date, currentTime: Date) -> Double {
        /* TODO: code the difference of alcohol rate after 5min
         - While alcoholRate > 0 {
            - Should be called only when the user consumed alcohol
            - lastAcoholRate =
            - 0,15g/L loss of alcohol rate every hour -> every 5min = (0,15g/L / 60) * 5
            - actualAlcoholRate = lastAcoholRate - (0,15 / 60) * 5
         - }
        */
        return 0.0
    }


    
    func updateAlcoholRate(newAlcoholRate: Double) {
        self.alcoholRate = newAlcoholRate
        defaults.set(alcoholRate, forKey: "alcoholRate")
    }
    
    func loadAlcoholRate() {
        let _ = defaults.string(forKey: "alcoholRate")
    }
}
