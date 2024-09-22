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
    @State private var alertMessage = ""
    var userSize: Int
    var userWeight: Int
    
    var body: some View {
        HStack {
            Button(action: {
                validateInputs()
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
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func validateInputs() {
        if userSize <= 0 {
            alertMessage = "Please enter a valid size."
            showingAlert = true
        } else if userWeight <= 0 {
            alertMessage = "Please enter a valid weight."
            showingAlert = true
        } else {
            dataManager.addInfos(size: userSize, weight: userWeight)
        }
    }
}

#Preview {
    MyButton(userSize: 180, userWeight: 70)
        .environmentObject(DataManager())
}
