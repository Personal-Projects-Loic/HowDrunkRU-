//
//  Untitled.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 20/09/2024.
//

import SwiftUI


// TODO: fix those buttons for login page
struct SignButtonView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var showingAlert = false
    var isSign: Bool

    var body: some View {
        if isSign == true {
            HStack {
                Button(action: {
                    Task {
                        await authManager.signInWithEmailPassword()
                        if authManager.authState == .signedIn {
                            showingAlert = true
                        }
                    }
                }) {
                    Text("Sign in")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(UIColor.lightYellow), Color.init(UIColor.lightYellow)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.bottom, 16)
                }
            }
        } else {
            HStack {
                Button(action: {
                    authManager.regularCreateAccount(email: authManager.email, password: authManager.password)
                }) {
                    Text("Sign up")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(UIColor.lightYellow), Color.init(UIColor.lightYellow)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.bottom, 16)
                }
                
            }
        }
    }
}

#Preview {
    SignOutButton()
        .environmentObject(AuthManager())
}
