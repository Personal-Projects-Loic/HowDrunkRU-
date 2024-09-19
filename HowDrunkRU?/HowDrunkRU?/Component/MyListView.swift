//
//  List.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 17/09/2024.
//

import SwiftUI

struct MyListView: View {
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Players : ")
                        .foregroundColor(Color.init(UIColor.lightYellow)),
                        content: {
                        Label("1 : Jean-Jaques était a 3,56g", systemImage: "person.fill")
                        .foregroundColor(Color.init(UIColor.brokenWhite))
                            .listRowBackground(Color.init(UIColor.lightBlack))
                        Label("2 : Loïc était a 3,32g", systemImage: "person.fill")
                            .foregroundColor(Color.init(UIColor.brokenWhite))
                            .listRowBackground(Color.init(UIColor.lightBlack))
                        Label("3 : Thomas était a 2,46g", systemImage: "person.fill")
                            .foregroundColor(Color.init(UIColor.brokenWhite))
                            .listRowBackground(Color.init(UIColor.lightBlack))
                        Label("4 : Pierre était a 1,89g", systemImage: "person.fill")
                            .foregroundColor(Color.init(UIColor.brokenWhite))
                            .listRowBackground(Color.init(UIColor.lightBlack))
                }
                )
            }
            .frame(height: 250)
            .scrollContentBackground(.hidden)
            .background(Color.init(UIColor.lightBlack))
        }
    }
}

#Preview {
    MyListView()
}
