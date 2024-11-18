//
//  TimerManager.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 27/09/2024.
//

import SwiftUI

class TimerManager: ObservableObject {
    
    func chrono(timeChrono: Int) {
        @State var timeRemaining = timeChrono
        let _ = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        if (timeRemaining > 0) {
            timeRemaining = timeRemaining - 1
        } else {
            print("prout")
            // TODO: I'm supppose to fetch alcohol rate and calculate the delta 
        }
    }
}
