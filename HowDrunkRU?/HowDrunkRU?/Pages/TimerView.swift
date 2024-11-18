//
//  Timer.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 02/10/2024.
//

import SwiftUI
import Foundation

struct TimerView: View {
    @State var timeRemaining = 5
    @EnvironmentObject var timeManager: TimerManager

    var body: some View {
        Text("oui")
    }
}

#Preview {
    TimerView()
        .environmentObject(TimerManager())
}
