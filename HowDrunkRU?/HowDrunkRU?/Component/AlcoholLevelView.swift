//
//  AlcoholLevelView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct AlcoholLevelView: View {
    @EnvironmentObject var appData: AppData
  
    var body: some View {
        VStack {
            Text("\(appData.alcoholRate, specifier: "%.2f")g")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(UIColor.lightYellow))
                .font(.title2)
            
            switch appData.alcoholRate {
            case 0:
                Text("You're sober, gg")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 0...0.10:
                Text("No....")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 0.10...0.25:
                Text("OUIII....")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 0.25...0.50:
                Text("pouet")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 0.50...0.75:
                Text("sayé t bourré le frr")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 1...1.25:
                Text("gg")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 1.25...1.75:
                Text("Wow la t'es biengggg")
                    .foregroundStyle(Color(UIColor.lightYellow))
            case 1.75...2.50:
                Text("la t'abuses")
                    .foregroundStyle(Color(UIColor.lightYellow))
            default:
                Text("Dude wtf")
                    .foregroundStyle(Color(UIColor.lightYellow))
            }
        }
        .onAppear {
            print("Before load", appData.alcoholRate)
            appData.loadAlcoholRate()
            print("after load", appData.alcoholRate)
        }
    }
}


#Preview {
    AlcoholLevelView()
        .environmentObject(AppData())
}
