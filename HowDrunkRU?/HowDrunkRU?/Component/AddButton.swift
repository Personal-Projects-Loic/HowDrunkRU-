//
//  AddButton.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Group{
                Button(action: {
                    print("tapped!")
                }, label: {
                     Image("bottle")
                        .resizable()
                        .padding()
                        .frame(width: 180, height: 180)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(Color.init(UIColor.lightYellow))
                        .cornerRadius(15)
                        .padding()
                })
            }.frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    AddButton()
}
