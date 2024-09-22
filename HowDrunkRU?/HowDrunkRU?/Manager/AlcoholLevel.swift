//
//  AlcoholLevel.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var alcohol: Float = 0.00
    @Published var multiplicator: Int = 1
    @Published var size: Int = 0
    @Published var weight: Int = 0
}
