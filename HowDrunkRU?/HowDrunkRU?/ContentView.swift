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
                HomePage()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                GamePage()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Games")
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
    ContentView().environmentObject(AppData())
}
