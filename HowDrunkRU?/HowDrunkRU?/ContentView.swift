//
//  ContentView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppData

    var body: some View {
        ZStack {
            Color(UIColor.lightPurple)
                .ignoresSafeArea()
            TitleComponent()
                .colorInvert()
        }
    }
}

#Preview {
    ContentView().environmentObject(AppData())
}
