//
//  ExcercisesAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/13/26.
//
import FirebaseFirestore
import Foundation

class ExcercisesAPI {
    static let shared = ExcercisesAPI()
    var db = Firestore.firestore()

    private init() {

    }

    func getAllExcercises() async throws -> [Excercise] {
        var excercises: [Excercise] = []

        do {
            let snapshot = try await db.collection("exercises").getDocuments()

            for document in snapshot.documents {
                do {
                    let exercise = try document.data(as: Excercise.self, decoder: Firestore.Decoder())
                    excercises.append(exercise)

                } catch {
                    print("Error decoding a specific document: \(error)")
                }
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }
        
        print("hi")
        
        return excercises
    }
    
    func updateStartingWeight(exerciseName: String, newWeight: String) async throws -> Void {
        
        do {
            let snapshot = try await db.collection("exercises")
                .whereField("name", isEqualTo: exerciseName)
                .getDocuments()
            
            guard let document = snapshot.documents.first else {
                print("No document found with name: \(exerciseName)")
                return
            }
            
            // 3. Update the field
            try await document.reference.updateData([
                "startingWeight": newWeight
            ])
        } catch {
            print("Error updating document")
        }
    }
    
    func deleteWorkoutFromExerciseList(exerciseName: String, date: String) {
        // this will be called once it's deleted yo
    }
    
    func addExcercise(name: String, location: String, muscleGroup: String) async throws -> Void {
        let newDocRef = db.collection("exercises").document()
        try await newDocRef.setData([
            "name": name,
            "location": location,
            "muscleGroup": muscleGroup,
            "startingWeight": "",
            "startingWeightDate": Date()
        ])
        print(
            "Successfully created a new document with an empty array."
        )
    }
}
