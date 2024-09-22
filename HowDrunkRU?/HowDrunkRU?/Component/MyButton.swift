//
//  MyButton.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 22/09/2024.
//

import SwiftUI

struct MyButton: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showingAlert = false
    var userSize: Int
    var userWeight: Int
    
    var body: some View {
        HStack {
            Button(action: {
                dataManager.addInfos(size: userSize, weight: userWeight)
            }) {
                Text("Send your infos")
                    .fontWeight(.heavy)
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.lightYellow), Color(UIColor.lightYellow)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.bottom, 16)
            }
        }
    }
}


#Preview {
    MyButton(userSize: 180, userWeight: 70)
        .environmentObject(DataManager())
}
