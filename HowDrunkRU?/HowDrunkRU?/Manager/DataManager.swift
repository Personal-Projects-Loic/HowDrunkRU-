//
//  DataManager.swift
//  HowDrunkRU?
//
//  Created by Loïc Rouzaud on 19/09/2024.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var alcohol: [Alcohol] = []
    
    init() {
        fetchAlcohol()
    }
    
    func fetchAlcohol() {
        alcohol.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Alcohol")
        ref.getDocuments() { snapshot, error in
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


}
