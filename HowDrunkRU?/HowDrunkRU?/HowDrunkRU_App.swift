//
//  HowDrunkRU_App.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
}

@main
struct HowDrunkRUApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var appData = AppData()
    //@StateObject var authManager: AuthManager
    
    //init() {
        //FirebaseApp.configure()
        //_authManager = StateObject(wrappedValue: AuthManager())
    //}
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                //.environmentObject(authManager)
        }
    }
}
