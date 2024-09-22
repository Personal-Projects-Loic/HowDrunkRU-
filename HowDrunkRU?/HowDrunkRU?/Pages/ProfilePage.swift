import SwiftUI
import FirebaseAuth

struct ProfilePage: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var appData: AppData

    @State private var sizeInput: String = ""
    @State private var weightInput: String = ""
    @State private var isEditing: Bool = false
    @State private var userInfos: UserInfos?

    var body: some View {
        ZStack {
            Color(UIColor.lightBlack)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                if authManager.authState == .signedIn {
                    ProfilePictureView()
                        .onAppear {
                            fetchUserData()
                        }

                    if let userInfos = userInfos, !isEditing {
                        Text("Your size: \(userInfos.size)")
                            .foregroundColor(Color(UIColor.brokenWhite))

                        Text("Your weight: \(userInfos.weight)")
                            .foregroundColor(Color(UIColor.brokenWhite))

                        Button("Edit Infos") {
                            isEditing.toggle()
                            sizeInput = String(userInfos.size)
                            weightInput = String(userInfos.weight)
                        }
                        .foregroundColor(Color(UIColor.lightYellow))
                    } else {
                        if userInfos == nil {
                            Text("Hey, enter your infos:")
                                .foregroundColor(Color(UIColor.brokenWhite))
                        }

                        InputField(title: "Your size:", text: $sizeInput)
                        InputField(title: "Your weight:", text: $weightInput)

                        MyButton(userSize: Int(sizeInput) ?? 0, userWeight: Int(weightInput) ?? 0) {
                            isEditing = false
                            fetchUserData()
                        }
                    }

                    VStack {
                        Text(authManager.user?.email ?? "Email placeholder")
                            .font(.title)
                            .foregroundColor(Color(UIColor.brokenWhite))
                        SignOutButton()
                    }
                }
            }
            .padding(60)
        }
    }

    func fetchUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        dataManager.fetchUserInfos(uid: uid) { fetchedUserInfos in
            self.userInfos = fetchedUserInfos
            if let userInfos = fetchedUserInfos {
                self.sizeInput = String(userInfos.size)
                self.weightInput = String(userInfos.weight)
            }
        }
    }
}

struct InputField: View {
    var title: String
    @Binding var text: String

    var body: some View {
        ZStack {
            TextField(title, text: $text)
                .foregroundColor(Color(UIColor.brokenWhite))
                .padding(.horizontal, 10)
                .frame(height: 42)
                .keyboardType(.numberPad)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .stroke(Color(UIColor.brokenWhite), lineWidth: 1)
                )
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.init(UIColor.brokenWhite))
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

#Preview {
    ProfilePage()
        .environmentObject(AuthManager())
        .environmentObject(DataManager())
        .environmentObject(AppData())
}
