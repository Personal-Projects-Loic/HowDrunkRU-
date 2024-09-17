//
//  HomeScreen.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var alcoholLevel: AppData

    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 40) {
                TitleView(title: "Drink together")
                AlcoholLevelView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            AddButton()
        }
    }
}

#Preview {
    HomePage()
        .environmentObject(AppData())
}
