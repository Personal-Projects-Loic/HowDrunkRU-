//
//  TextFieldView.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 18/09/2024.
//

import SwiftUI


struct TextFieldView: View {
    @Binding var data: String
    var title: String?
    var isSecure: Bool
    
    var body: some View {
        if (isSecure == false) {
            ZStack {
                TextField("", text: $data)
                    .foregroundColor(Color.init(UIColor.brokenWhite))
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.init(UIColor.brokenWhite), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                HStack {
                    Text(title ?? "Input")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(UIColor.brokenWhite))
                        .multilineTextAlignment(.leading)
                        .padding(4)
                        .background(Color.init(UIColor.lightBlack))
                    Spacer()
                }
                .padding(.leading, 8)
                .offset(CGSize(width: 0, height: -20))
            }
            .padding(4)
        } else {
            ZStack {
                SecureField("", text: $data)
                    .foregroundColor(Color.init(UIColor.brokenWhite))
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.init(UIColor.brokenWhite), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                HStack {
                    Text(title ?? "Input")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.init(UIColor.brokenWhite))
                        .multilineTextAlignment(.leading)
                        .padding(4)
                        .background(Color.init(UIColor.lightBlack))
                    Spacer()
                }
                .padding(.leading, 8)
                .offset(CGSize(width: 0, height: -20))
            }
            .padding(4)
        }
    }
}

struct InputFieldViewPreviews: PreviewProvider {
    @State static var data: String = ""
    
    static var previews: some View {
        TextFieldView(data: $data, title: "Password", isSecure: true)
    }
}
