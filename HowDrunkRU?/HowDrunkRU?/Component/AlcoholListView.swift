//
//  AlcoholList.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI
import FirebaseAuth

struct AlcoholListView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var appData: AppData
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedAlcohol: Alcohol?
    @State private var currentUser: UserInfos?
    @State private var showErrorAlert = false
    @State private var errorMessage: String = ""
    @State private var calculatedAlcoholRate: Double = 0.0
    @State private var showRateAlert = false
    @State private var showingAlert = false
    @State private var quantity: String = ""

    var body: some View {
        NavigationView {
            VStack {
                alcoholList
                    .navigationTitle("Alcohol List")
                    .onAppear(perform: fetchUserData)
                    .alert(isPresented: $showErrorAlert) {
                        Alert(title: Text("Error"),
                              message: Text(errorMessage),
                              dismissButton: .default(Text("OK")))
                    }
                    .alert("Enter quantity in cL", isPresented: $showingAlert) {
                        TextField("Enter quantity in cL", text: $quantity)
                            .keyboardType(.decimalPad)
                        Button("OK", action: submit)
                    } message: {
                        Text("Please enter the quantity of alcohol you consumed.")
                    }
                    .alert(isPresented: $showRateAlert) {
                        Alert(title: Text("Calculated Alcohol Rate"),
                              message: Text("Your alcohol rate is \(calculatedAlcoholRate, specifier: "%.2f") ‰."),
                              dismissButton: .default(Text("OK")) {
                                  presentationMode.wrappedValue.dismiss()
                              })
                    }
            }
        }
    }

    private var alcoholList: some View {
        List(dataManager.alcohol, id: \.id) { alcohol in
            Button(action: {
                selectedAlcohol = alcohol
                showingAlert = true
            }) {
                HStack {
                    Text("\(alcohol.name) \(alcohol.percentage)% \(alcohol.type)")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
        }
    }

    private func submit() {
        guard let quantityValue = Double(quantity) else {
            errorMessage = "Invalid quantity input."
            showErrorAlert = true
            return
        }

        guard let selectedAlcohol = selectedAlcohol,
              let currentUser = currentUser else {
            errorMessage = "Missing alcohol or user information."
            showErrorAlert = true
            return
        }

        calculatedAlcoholRate = appData.calculateAlcoholRate(user: currentUser, alcohol: selectedAlcohol, quantityInCL: quantityValue)
        
        appData.updateAlcoholRate(newAlcoholRate: appData.alcoholRate + calculatedAlcoholRate)
        showRateAlert = true
        quantity = ""
    }

    private func fetchUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        dataManager.fetchUserInfos(uid: uid) { fetchedUserInfos in
            self.currentUser = fetchedUserInfos
            if fetchedUserInfos == nil {
                errorMessage = "User should enter their info before."
                showErrorAlert = true
            } else {
                print("User data fetched: \(String(describing: self.currentUser))")
            }
        }
    }
}

#Preview {
    AlcoholListView()
        .environmentObject(DataManager())
        .environmentObject(AppData())
}
