//
//  ContentView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppData
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.brokenWhite
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                HomePageView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                GamePage()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Games")
                    }
                StatistiquePage()
                    .tabItem {
                        Image(systemName: "slider.vertical.3")
                        Text("Statistiques")
                    }

                ProfilePage()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
        .tint(Color.init(UIColor.lightYellow))
    }
}

#Preview {
    ContentView()
        .environmentObject(AppData())
        //.environmentObject(AuthManager())
}
