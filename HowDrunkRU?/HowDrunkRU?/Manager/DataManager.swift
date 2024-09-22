//
//  DataManager.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

class DataManager: ObservableObject {
    @Published var alcohol: [Alcohol] = []
    @Published var userInfos: UserInfos = UserInfos(id: "", size: 0, weight: 0)
    
    init() {
        fetchAlcohol()
    }
    
    func fetchAlcohol() {
        alcohol.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Alcohol")
    
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let percentage = data["percentage"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    
                    let alcohol = Alcohol(id: id, name: name, percentage: percentage, type: type)
                    self.alcohol.append(alcohol)
                }
            }
        }
    }
    
    func addAlcohol(alcoholName: String, alcoholPercent: String, alcoholType: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Alcohol")
        
        ref.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching alcohols: \(error.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                var highestID = 0
                for document in snapshot.documents {
                    let data = document.data()
                    if let idString = data["id"] as? String, let id = Int(idString) {
                        highestID = max(highestID, id)
                    }
                }
                
                let newID = highestID + 1
                
                let alcoholData: [String: Any] = [
                    "name": alcoholName,
                    "percentage": alcoholPercent,
                    "type": alcoholType,
                    "id": String(newID)
                ]
                
                ref.document().setData(alcoholData) { error in
                    if let error = error {
                        print("Error adding alcohol: \(error.localizedDescription)")
                    } else {
                        print("Alcohol successfully added with ID \(newID)!")
                    }
                }
            }
        }
    }
    
    func updateUserInfos(size: Int, weight: Int) {
            self.userInfos.size = size
            self.userInfos.weight = weight
    }
        
    func fetchUserInfos(uid: String, completion: @escaping (UserInfos?) -> Void) {
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(uid)
        
        ref.getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                let size = data?["size"] as? Int ?? 0
                let weight = data?["weight"] as? Int ?? 0
                completion(UserInfos(id: uid, size: size, weight: weight))
            } else {
                completion(nil)
            }
        }
    }
    
    func addInfos(size: Int, weight: Int) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(uid)
        
        let userData: [String: Any] = [
            "id": uid,
            "size": size,
            "weight": weight
        ]
        
        ref.setData(userData, merge: true) { error in
            if let error = error {
                print("Error adding user data: \(error.localizedDescription)")
            } else {
                print("User data successfully added!")
            }
        }
    }

}
