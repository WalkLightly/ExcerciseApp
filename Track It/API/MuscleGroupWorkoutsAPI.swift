//
//  MuscleGroupWorkoutsAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/14/26.
//
import Foundation
import FirebaseFirestore

class MuscleGroupWorkoutsAPI {
    static let shared = MuscleGroupWorkoutsAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
    func getAllMuscleGroupWorkouts() async throws -> [MuscleGroupWorkout] {
        var data : [MuscleGroupWorkout] = []
        var ss: [Any] = []
        
        do {
            let snapshot = try await db.collection("muscle_group_workouts").getDocuments()
            
            for document in snapshot.documents {
                let dbData = document.data()
            
                let excercise = MuscleGroupWorkout(
                   id: document.documentID,
                   muscleGroup: dbData["muscleGroup"] as? String ?? "",
                   exercises: parseExcercisesData(dbData["exercises"]),
                   date: dbData["date"] as? Timestamp ?? Timestamp()
               )
                
                data.append(excercise)
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }
        
        print(data)
        
        return data
    }
    
    func parseExcercisesData(_ data: Any) -> [ExcerciseWorkout] {
        var exercises: [ExcerciseWorkout] = []
        
        if let exerciseArray = data as? [[String: Any]] {
            
            // 2. Loop through each exercise dictionary in the array
            for exercise in exerciseArray {
                
                // 3. Extract the string values safely using optional binding
                let name = exercise["name"] as? String ?? ""
                let location = exercise["location"] as? String ?? ""
                let muscleGroup = exercise["muscleGroup"] as? String ?? ""
                let sets = exercise["sets"] as? [String] ?? []
                
                exercises.append(ExcerciseWorkout(
                    name: name,
                    location: location,
                    muscleGroup: muscleGroup,
                    sets: sets,
                    isAddedIn: true
                ))
                
            }
        } else {
            print("Data is either nil or not in the expected array-of-dictionaries format.")
        }
        
        return exercises
    }
    
}


