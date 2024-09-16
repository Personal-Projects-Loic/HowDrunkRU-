//
//  TitleComponent.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 16/09/2024.
//

import SwiftUI

struct TitleComponent: View {
    var body : some View {
        HStack() {
            Text("HowDrunkRU?")
                .font(.largeTitle.bold())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    TitleComponent()
}
