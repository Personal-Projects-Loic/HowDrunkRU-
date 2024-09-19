//
//  Untitled.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import SwiftUI
import AuthenticationServices

struct SignOutButton: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        Button {
            Task {
                await signOutHere()
            }
        } label: {
            Text("Sign out")
                .font(.body.bold())
                .foregroundStyle(.red)
        }
    }
    func signOutHere() async {
        do {
            try await authManager.signOut()
            print("Successfully signed out")
        } catch {
            print("Error signing out: \(error)")
        }
    }
}

#Preview {
    SignOutButton()
        .environmentObject(AuthManager())
}
