//
//  Alcohol.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI

struct Alcohol: Identifiable {
    var id: String
    var name : String
    var percentage: String
    var type: String
}

struct UserInfos: Identifiable {
    var id: String
    var size: Int
    var weight: Int
}
