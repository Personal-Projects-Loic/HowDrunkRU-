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
    @State private var showAddButton = false

    var body: some View {
        NavigationView {
            VStack {
                alcoholList
                    .navigationTitle("Alcohol List")
                    .navigationBarItems(trailing: showAddButton ? addButton : nil)
                    .onAppear {
                        updateAddButtonVisibility()
                    }
            }
            .sheet(isPresented: $showAlcoholSheet) {
                NewAlcoholView()
                    .presentationDetents([.medium, .large])
            }
        }
    }

    private var alcoholList: some View {
        List(dataManager.alcohol, id: \.id) { alcohol in
            Text(alcohol.name + " " + "\(alcohol.percentage)%" + " " + alcohol.type)
        }
    }

    private var addButton: some View {
        Button(action: {
            showAlcoholSheet.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }

    private func updateAddButtonVisibility() {
        let screenHeight = UIScreen.main.bounds.height
        let listHeight = 200.0

        print("SCREEN HEIGHt : ", screenHeight)
        showAddButton = listHeight > screenHeight / 2
    }
}
#Preview {
    AlcoholListView()
        .environmentObject(DataManager())
}
