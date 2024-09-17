//
//  AlcoholLevel.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var alcohol: Float = 1.26
    @Published var multiplicator: Int = 1
}
