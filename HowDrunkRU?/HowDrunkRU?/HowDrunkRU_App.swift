//
//  HowDrunkRU_App.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

@main
struct HowDrunkRUApp: App {
    @StateObject var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
