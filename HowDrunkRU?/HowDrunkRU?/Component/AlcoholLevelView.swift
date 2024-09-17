//
//  AlcoholLevelView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct AlcoholLevelView: View {
    @EnvironmentObject var alcoholLevel: AppData
    
    var body: some View {
        VStack {
            Text("\(alcoholLevel.alcohol, specifier: "%.2f")g")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.init(UIColor.lightYellow))
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            
            switch alcoholLevel.alcohol {
            case 0:
                Text("You're sober, gg")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 0...0.10:
                Text("No....")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 0.10...0.25:
                Text("OUIII....")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 0.25...0.50:
                Text("pouet")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 0.50...0.75:
                Text("sayé t bourré le frr")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 1...1.25:
                Text("gg")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 1.25...1.75:
                Text("Wow la t'es biengggg")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            case 1.75...2.50:
                Text("la t'abuses")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            default:
                Text("Dude wtf")
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            }
            
        }
    }
}

#Preview {
    AlcoholLevelView()
        .environmentObject(AppData())
}
