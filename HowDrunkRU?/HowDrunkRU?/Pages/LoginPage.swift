//
//  LoginPage.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import SwiftUI
import AuthenticationServices

struct LoginPage: View {
    @State var username: String = ""
    @State var password: String = ""
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    @State private var showingAlert = false


    var body: some View {
        NavigationStack {
            
            
            ZStack {
                Color(UIColor.lightBlack)
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 42)
                        .foregroundStyle(Color.init(UIColor.lightYellow))
                    VStack(spacing: 16.0) {
                        TextFieldView(data: $username, title: "Username")
                        TextFieldView(data: $password, title: "Password")
                    }
                    Button(action: {}) {
                        Text("Sign In")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.init(UIColor.lightYellow), Color.init(UIColor.lightYellow)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .padding(.bottom, 16)
                    }
                    .padding(.top, 16)
                    HStack {
                        SignInWithAppleButton(
                            onRequest: { request in
                                // TODO: Request Apple Authorization
                            },
                            onCompletion: { result in
                                // TODO: Handle AppleID Completion
                            }
                        )
                        .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
                        .frame(width: 140, height: 35, alignment: .center)
                        SignInWithAppleButton(
                            onRequest: { request in
                                // TODO: Request Apple Authorization
                            },
                            onCompletion: { result in
                                // TODO: Handle AppleID Completion
                            }
                        )
                        .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
                        .frame(width: 140, height: 35, alignment: .center)
                    }
                    Button {
                        Task {
                            await signAnonymously()
                        }
                    } label: {
                        Text("Skip")
                            .font(.body.bold())
                            .frame(width: 280, height: 45, alignment: .center)
                    }
                }
                .padding(30)
            }
            .alert("You signed in as anonymous", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    func signAnonymously() async {
        do {
            _ = try await authManager.signInAnonymously()
            print("Anonymous sign-in successful")
        } catch {
            print("SignInAnonymouslyError: \(error)")
        }
    }
}


#Preview {
    LoginPage()
        .environmentObject(AuthManager())
}
