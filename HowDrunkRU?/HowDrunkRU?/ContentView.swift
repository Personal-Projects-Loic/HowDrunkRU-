//
//  ContentView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ContentView: View {
    @EnvironmentObject var appState: AppData
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
    ContentView().environmentObject(AppData())
}
