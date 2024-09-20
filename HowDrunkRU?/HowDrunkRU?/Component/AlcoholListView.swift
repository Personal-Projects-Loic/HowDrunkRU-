//
//  AlcoholList.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI

struct AlcoholListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showAlcoholSheet = false
    
    var body: some View {
        NavigationView {
            List(dataManager.alcohol, id: \.id) { alcohol in
                Text(alcohol.name + " " + "\(alcohol.percentage)%" + " " + alcohol.type)
            }
            .navigationTitle("Alcohol List")
            .navigationBarItems(trailing: Button(action: {
                showAlcoholSheet.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showAlcoholSheet) {
                NewAlcoholView()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}


#Preview {
    AlcoholListView()
        .environmentObject(DataManager())
}
