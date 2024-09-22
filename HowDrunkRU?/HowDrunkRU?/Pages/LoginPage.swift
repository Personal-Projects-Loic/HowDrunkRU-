import SwiftUI
import AuthenticationServices

struct LoginPage: View {
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
                        TextFieldView(data: $authManager.email, title: "Email", isSecure: false)
                        TextFieldView(data: $authManager.password, title: "Password", isSecure: true)
                    }
                    
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
                    
                    if authManager.authState == .signedOut {
                        Button {
                            Task {
                                await authManager.signInAnonymously()
                            }
                        } label: {
                            Text("Skip")
                                .font(.body.bold())
                                .frame(width: 280, height: 45, alignment: .center)
                        }
                    }
                }
                .padding(30)
            }
            .alert("Sign-in successful", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            }
            .alert(authManager.errorMessage, isPresented: $authManager.hasError) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

#Preview {
    LoginPage()
        .environmentObject(AuthManager())
}

