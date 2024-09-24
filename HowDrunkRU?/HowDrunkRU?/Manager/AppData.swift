//
//  AlcoholLevel.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var alcoholRate: Double = 0.00
    @Published var alcohol: Float = 0.00
    @Published var multiplicator: Int = 1
    @Published var size: Int = 0
    @Published var weight: Int = 0

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
    
    func updateAlcoholRate(newAlcoholRate: Double) {
        alcoholRate = newAlcoholRate
    }
}
