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
            
            switch alcoholLevel.alcohol {
            case 0:
                Text("You're sober, gg")
            case 0...0.10:
                Text("No....")
            case 0.10...0.25:
                Text("OUIII....")
            case 0.25...0.50:
                Text("pouet")
            default:
                Text("Dude wtf")
            }
            
        }
    }
}

#Preview {
    AlcoholLevelView()
        .environmentObject(AppData())
}
