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
    var wieghtTitle: String = "Enter your size"

    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                if authManager.authState == .signedIn {
                    ProfilePictureView()
                    
                    TextField("Your size: ", value: $dataManager.userInfos.size, formatter: NumberFormatter())
                        .foregroundColor(Color(UIColor.brokenWhite))
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color(UIColor.brokenWhite), lineWidth: 1)
                        )
                    
                    TextField("Your weight: ", value: $dataManager.userInfos.weight, formatter: NumberFormatter())
                        .foregroundColor(Color(UIColor.brokenWhite))
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color(UIColor.brokenWhite), lineWidth: 1)
                        )
                    
                    MyButton(userSize: dataManager.userInfos.size, userWeight: dataManager.userInfos.weight)
                    
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

