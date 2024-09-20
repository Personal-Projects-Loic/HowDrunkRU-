//
//  AddButton.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct AddButton: View {
    @State private var showAlcoholSheet = false
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        Group{
            Button(action: {
                showAlcoholSheet.toggle()
            }, label: {
                Image("bottle")
                    .resizable()
                    .padding()
                    .frame(width: 180, height: 180)
                    .foregroundColor(.white)
                    .background(Color.init(UIColor.lightYellow))
                    .cornerRadius(15)
                    .padding()
            })
            .sheet(isPresented: $showAlcoholSheet) {
                AlcoholListView()
                    .presentationDetents([.medium, .large])
            }
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    AddButton()
        .environmentObject(DataManager())
}
