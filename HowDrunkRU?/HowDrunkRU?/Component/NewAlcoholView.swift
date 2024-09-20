//
//  NewAlcoholView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 20/09/2024.
//

import SwiftUI

struct NewAlcoholView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newAlcohol = ""
    @State private var newAlcoholPercent = ""
    @State private var newAlcoholType = ""

    var body: some View {
        VStack {
            TextField("Alcohol", text: $newAlcohol)
                .autocorrectionDisabled()
            TextField("Percentage", text: $newAlcoholPercent)
                .autocorrectionDisabled()
            TextField("Type", text: $newAlcoholType)
                .autocorrectionDisabled()

            Button {
                dataManager.addAlcohol(alcoholName: newAlcohol, alcoholPercent: newAlcoholType, alcoholType: newAlcoholType)
            } label: {
                Text("Save")
            }
        }
        .padding(60)
    }
}

#Preview {
    NewAlcoholView()
        .environmentObject(DataManager())
}
