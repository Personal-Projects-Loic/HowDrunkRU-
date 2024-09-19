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
            SignOutButton()
        }
    }
}

#Preview {
    ProfilePage()
        .environmentObject(AuthManager())
}
