//
//  TitleComponent.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct TitleView: View {
    var body : some View {
        HStack() {
            Text("Drink together")
                .font(Font.custom("myFont.ttf", size: 56))
                .fontWeight(.semibold)
                .foregroundStyle(Color.init(UIColor.lightYellow))
        }
        .frame(maxWidth: .infinity, alignment: .top)
        
    }
}

#Preview {
    TitleView()
}
