//
//  AlcoholList.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI

struct AlcoholListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List(dataManager.alcohol, id: \.id) { alcohol in
                Text(alcohol.name + " " + "\(alcohol.percentage)%" + " " + alcohol.type)
            }
            .navigationTitle("Alcohol List")
            .navigationBarItems(trailing: Button(action: {
                // Action pour ajouter un nouvel alcool
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}


#Preview {
    AlcoholListView()
        .environmentObject(DataManager())
}
