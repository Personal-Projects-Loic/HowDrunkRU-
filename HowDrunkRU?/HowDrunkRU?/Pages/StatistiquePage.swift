//
//  Statistique.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import SwiftUI

struct StatistiquePage: View {
    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            TitleView(title: "Statistiques", top: false)
        }
    }
}

#Preview {
    StatistiquePage()
}
