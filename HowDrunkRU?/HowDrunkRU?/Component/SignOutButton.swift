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
    @State private var isLoggedIn = false
    @State private var showLoginSheet = false

    var body: some View {
        VStack {
            Button {
                if authManager.authState != .signedIn {
                    showLoginSheet = true
                } else {
                    signOut()
                }
            } label: {
                Text(authManager.authState != .signedIn ? "Sign-in" :"Sign out")
                    .font(.body.bold())
                    .frame(width: 120, height: 45, alignment: .center)
                    .foregroundStyle(Color.init(UIColor.brokenWhite))
                    .background(Color.init(UIColor.lightYellow))
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showLoginSheet) {
            LoginPage()
        }
    }

    func signOut() {
        Task {
            do {
                try await authManager.signOut()
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    SignOutButton()
        .environmentObject(AuthManager())
}
