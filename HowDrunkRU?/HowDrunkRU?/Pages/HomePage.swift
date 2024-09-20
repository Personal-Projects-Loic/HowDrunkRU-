//
//  HomeScreen.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var alcoholLevel: AppData
    
    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 40) {
                TitleView(title: "Drink together", top: true)
                AlcoholLevelView()
                AddButton()
                MyListView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}

#Preview {
    HomePageView()
        .environmentObject(AppData())
}
