//
//  ProfilePage.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            ProfilePictureView()
            VStack(alignment: .center) {
                if authManager.authState == .signedIn {
                    Text(authManager.user?.displayName ?? "Name placeholder")
                        .font(.headline)
                        .foregroundColor(Color.init(UIColor.brokenWhite))
                    Text(authManager.user?.email ?? "Email placeholder")
                        .font(.title)
                        .foregroundColor(Color.init(UIColor.brokenWhite))
                }
                else {
                    Text("Sign-in to view data!")
                        .font(.headline)
                }
                SignOutButton()
            }
            
        }
    }
}

#Preview {
    ProfilePage()
        .environmentObject(AuthManager())
}
