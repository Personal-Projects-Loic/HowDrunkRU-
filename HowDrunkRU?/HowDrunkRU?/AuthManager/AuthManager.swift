//
//  AuthManager.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import Foundation
import FirebaseAuth
import SwiftUI
import AuthenticationServices

enum AuthState {
    case authenticated // Anonymously authenticated in Firebase.
    case signedIn // Authenticated in Firebase using one of service providers, and not anonymous.
    case signedOut // Not authenticated in Firebase.
}

@MainActor
class AuthManager: ObservableObject {
    @Published var authState: AuthState = .signedOut
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: FirebaseAuth.User?
    @Published var hasError = false
    @Published var errorMessage = ""

    private var authStateHandle: AuthStateDidChangeListenerHandle!

    init() {
        configureAuthStateChanges()
    }

    func configureAuthStateChanges() {
        authStateHandle = Auth.auth().addStateDidChangeListener { auth, user in
            self.updateState(user: user)
        }
    }

    func updateState(user: FirebaseAuth.User?) {
        self.user = user
        let isAuthenticatedUser = user != nil
        let isAnonymous = user?.isAnonymous ?? false

        if isAuthenticatedUser {
            self.authState = isAnonymous ? .authenticated : .signedIn
        } else {
            self.authState = .signedOut
        }
    }

    func signInWithEmailPassword() async {
        hasError = false
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            updateState(user: authResult.user)
            print("Email sign-in successful: \(authResult.user.email ?? "")")
        } catch {
            hasError = true
            errorMessage = error.localizedDescription
            print("Email sign-in error: \(error.localizedDescription)")
        }
    }

    func signInAnonymously() async {
        hasError = false
        do {
            let result = try await Auth.auth().signInAnonymously()
            print("Anonymous sign-in successful, UID: \(result.user.uid)")
            updateState(user: result.user)
        } catch {
            hasError = true
            errorMessage = error.localizedDescription
            print("Anonymous sign-in error: \(error.localizedDescription)")
        }
    }

    func signOut() async {
        hasError = false
        do {
            try Auth.auth().signOut()
            updateState(user: nil)
            print("Sign-out successful")
        } catch {
            hasError = true
            errorMessage = error.localizedDescription
            print("Sign-out error: \(error.localizedDescription)")
        }
    }

    deinit {
        Auth.auth().removeStateDidChangeListener(authStateHandle)
    }
}
