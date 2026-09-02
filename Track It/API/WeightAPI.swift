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
            "bodyPart": bodyPart,
            "current": true
        ])
        print(
            "Successfully created a new document with an empty array."
        )
        
        // make the other ones not current for that body part
    }
    
    func getCurrentMeasurements() async throws -> [Measurement] {
        
        var currentMeasurements: [Measurement] = []
        var formattedMeasurements: [Measurement] = []
        
        do {
            let querySnapshot = try await db.collection("measurements")
                .getDocuments()
            
            for document in querySnapshot.documents {
                let data = document.data()
                
                let meas = Measurement(
                    id: document.documentID,
                    bodyPart: data["bodyPart"] as? String ?? "",
                    measurement: data["measurement"] as? String ?? "",
                    dateRecorded: data["date"] as? String ?? "",
                    current: data["current"] as? Bool ?? false
                )
                
                if meas.current == true {
                    formattedMeasurements.append(meas)
                    currentMeasurements.append(meas)
                }

            }
        } catch {
            print("Error getting muscle groups: \(error)")
        }
        // Shoulders
        // Chest
        // Right Arm
        // Right Forearm
        // Left Arm
        // Left Forearm
        // Right Leg
        // Right Calf
        // Left Leg
        // Left Calf
        // Glutes
 



        
        // format the list to look better
        formattedMeasurements[0] = currentMeasurements.first(where: { $0.bodyPart == "Shoulders" })!
        formattedMeasurements[1] = currentMeasurements.first(where: { $0.bodyPart == "Chest" })!
        formattedMeasurements[2] = currentMeasurements.first(where: { $0.bodyPart == "Right Arm" })!
        formattedMeasurements[3] = currentMeasurements.first(where: { $0.bodyPart == "Left Arm" })!
        formattedMeasurements[4] = currentMeasurements.first(where: { $0.bodyPart == "Right Forearm" })!
        formattedMeasurements[5] = currentMeasurements.first(where: { $0.bodyPart == "Left Forearm" })!
        formattedMeasurements[6] = currentMeasurements.first(where: { $0.bodyPart == "Right Leg" })!
        formattedMeasurements[7] = currentMeasurements.first(where: { $0.bodyPart == "Left Leg" })!
        formattedMeasurements[8] = currentMeasurements.first(where: { $0.bodyPart == "Right Calf" })!
        formattedMeasurements[9] = currentMeasurements.first(where: { $0.bodyPart == "Left Calf" })!
        formattedMeasurements[10] = currentMeasurements.first(where: { $0.bodyPart == "Glutes" })!

        
        
        return formattedMeasurements
    }
}
