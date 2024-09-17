//
//  ProfilePage.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            ProfilePicture()
        }
    }
}

#Preview {
    ProfilePage()
}
