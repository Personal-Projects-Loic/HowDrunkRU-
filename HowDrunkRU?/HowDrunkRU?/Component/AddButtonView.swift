//
//  AddButton.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct AddButton: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationLink(destination: AlcoholListPage()) {
            Image("bottle")
                .resizable()
                .padding()
                .frame(width: 180, height: 180)
                .foregroundColor(.white)
                .background(Color.init(UIColor.lightYellow))
                .cornerRadius(15)
                .padding()
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    NavigationView {
        AddButton()
            .environmentObject(DataManager())
    }
}
