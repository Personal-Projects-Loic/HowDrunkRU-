//
//  AlcoholList.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI

struct AlcoholList: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        List(dataManager.alcohol, id: \.id) { alcohol in
            Text(alcohol.name + " " + alcohol.percentage + "% " + alcohol.type)
            
        }
    }
}

#Preview {
    AlcoholList()
        .environmentObject(DataManager())
}
