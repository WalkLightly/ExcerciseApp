//
//  WeightAPI.swift
//  Track It
//
//  Created by Michael Knight on 8/3/26.
//
import FirebaseFirestore
import Foundation

class WeightAPI {
    static let shared = WeightAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
    func getWeights() async throws -> [Weight] {
        
        var weights: [Weight] = []
        
        do {
            let snapshot = try await db.collection("weights").getDocuments()

            for document in snapshot.documents {
                do {
                    let weight = try document.data(as: Weight.self)
                    weights.append(weight)

                } catch {
                    print("Error decoding a specific document: \(error)")
                }
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }
        
        return weights
    }
    
    func addWeight(weight: String) async throws -> Void {
        let newDocRef = db.collection("weights").document()
        try await newDocRef.setData([
            "date": Date().formatted(),
            "weight": weight
        ])
        print(
            "Successfully created a new document with an empty array."
        )
    }
    
    func addMeasurement(bodyPart: String, measurement: String) async throws -> Void {
        let newDocRef = db.collection("measurements").document()
        try await newDocRef.setData([
            "date": Date().formatted(),
            "measurement": measurement,
            "bodyPart": bodyPart
        ])
        print(
            "Successfully created a new document with an empty array."
        )
    }
}
