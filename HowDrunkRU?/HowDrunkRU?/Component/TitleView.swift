//
//  TitleComponent.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var top: Bool
    
    var body : some View {
        if (top == true) {
            HStack() {
                Text(title)
                    .font(Font.custom("myFont.ttf", size: 56))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            }
            .frame(maxWidth: .infinity, alignment: .top)
        } else {
            HStack() {
                Text(title)
                    .font(Font.custom("myFont.ttf", size: 56))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.init(UIColor.lightYellow))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
    }
}

#Preview {
    TitleView(title: "Drink together", top: true)
}
