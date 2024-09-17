//
//  ProfilePicture.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct ProfilePicture: View {
    var body: some View {
        VStack {
            Image("blank-pp")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20).stroke(Color.init(UIColor.lightYellow), lineWidth: 4)
                }
                .shadow(radius: 7)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}


#Preview {
    ProfilePicture()
}
