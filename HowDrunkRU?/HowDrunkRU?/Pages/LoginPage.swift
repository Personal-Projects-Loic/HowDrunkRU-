//
//  LoginPage.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import SwiftUI

struct LoginPage: View {
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
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
                }
                HStack {
                    Spacer()
                    Text("Forgotten Password?")
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(UIColor.lightYellow))
                        .underline()
                }
                .padding(.top, 16)
            }
            .padding(30)
        }
    }
}


#Preview {
    LoginPage()
}
