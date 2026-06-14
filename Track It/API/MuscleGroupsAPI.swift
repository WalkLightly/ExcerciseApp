//
//  MuscleGroupsAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/13/26.
//
import Foundation
import FirebaseFirestore

class MuscleGroupsAPI {
    static let shared = MuscleGroupsAPI()
    var db = Firestore.firestore()

    private init() {

    }

    func getAllMuscleGroups() async throws -> [MuscleGroup] {
        var muscleGroups: [MuscleGroup] = []
        
        do {
            let querySnapshot = try await db.collection("muscle_groups")
                .getDocuments()
            
            for document in querySnapshot.documents {
                let data = document.data()
                
                let muscleGroup = MuscleGroup(
                    id: document.documentID,
                    name: data["name"] as? String ?? "",
                    excercises: data["excercises"] as? [String] ?? [""]
                )

                muscleGroups.append(muscleGroup)
            }
        } catch {
            print("Error getting muscle groups: \(error)")
        }

        return muscleGroups
    }

}
