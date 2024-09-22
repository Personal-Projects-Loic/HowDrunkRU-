//
//  ProfilePage.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var appData: AppData

    @State private var sizeInput: String = ""
    @State private var weightInput: String = ""
    @State private var isEditing: Bool = false
    @State private var showingNoDataAlert: Bool = false
    var sizeTitle: String = "Enter your size"
    var weightTitle: String = "Enter your weight"

    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                if authManager.authState == .signedIn {
                    ProfilePictureView()
                    
                    ZStack {
                        TextField("Your size:", text: $sizeInput)
                            .foregroundColor(Color(UIColor.brokenWhite))
                            .padding(.horizontal, 10)
                            .frame(height: 42)
                            .keyboardType(.numberPad)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .stroke(Color(UIColor.brokenWhite), lineWidth: 1)
                            )
                        HStack {
                            Text("Entrer your size")
                                .font(.headline)
                                .fontWeight(.thin)
                                .foregroundColor(Color.init(UIColor.brokenWhite))
                                .multilineTextAlignment(.leading)
                                .padding(4)
                                .background(Color.init(UIColor.lightBlack))
                            Spacer()
                        }
                        .padding(.leading, 8)
                        .offset(CGSize(width: 0, height: -20))
                    }
                    .padding(4)
                    
                    ZStack {
                        TextField("Your weight:", text: $weightInput)
                            .foregroundColor(Color(UIColor.brokenWhite))
                            .padding(.horizontal, 10)
                            .frame(height: 42)
                            .keyboardType(.numberPad)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .stroke(Color(UIColor.brokenWhite), lineWidth: 1)
                            )
                        HStack {
                            Text("Entrer your weight")
                                .font(.headline)
                                .fontWeight(.thin)
                                .foregroundColor(Color.init(UIColor.brokenWhite))
                                .multilineTextAlignment(.leading)
                                .padding(4)
                                .background(Color.init(UIColor.lightBlack))
                            Spacer()
                        }
                        .padding(.leading, 8)
                        .offset(CGSize(width: 0, height: -20))
                    }
                    MyButton(userSize: Int(sizeInput) ?? 0, userWeight: Int(weightInput) ?? 0)
                    
                    Text(authManager.user?.displayName ?? "Name placeholder")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.brokenWhite))
                    Text(authManager.user?.email ?? "Email placeholder")
                        .font(.title)
                        .foregroundColor(Color(UIColor.brokenWhite))
                    SignOutButton()
                }
            }
            .padding(60)
        }
    }
}

#Preview {
    ProfilePage()
        .environmentObject(AuthManager())
        .environmentObject(DataManager())
        .environmentObject(AppData())
}

