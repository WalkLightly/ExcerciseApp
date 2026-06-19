import FirebaseFirestore
//
//  MuscleGroupWorkoutsAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/14/26.
//
import Foundation

class MuscleGroupWorkoutsAPI {
    static let shared = MuscleGroupWorkoutsAPI()
    var db = Firestore.firestore()

    private init() {

    }

    func getAllMuscleGroupWorkoutsForDate(date: String) async throws
        -> [MuscleGroupWorkout]
    {
        var data: [MuscleGroupWorkout] = []
        print(date)

        do {
            let snapshot = try await db.collection("muscle_group_workouts")
                .whereField("date", isEqualTo: date)
                .getDocuments()

            for document in snapshot.documents {
                let dbData = document.data()

                let excercise = MuscleGroupWorkout(
                    id: document.documentID,
                    muscleGroup: dbData["muscleGroup"] as? String ?? "",
                    exercises: parseExcercisesData(
                        data: dbData["exercises"] as? [[String: Any]] ?? [[:]]
                    ),
                    date: dbData["date"] as? String ?? ""
                )

                data.append(excercise)
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }

        return data
    }
    
    func getAllMuscleGroupWorkouts()  async throws
    -> [MuscleGroupWorkout] {
        var data: [MuscleGroupWorkout] = []

        do {
            let snapshot = try await db.collection("muscle_group_workouts")
                .getDocuments()

            for document in snapshot.documents {
                let dbData = document.data()

                let excercise = MuscleGroupWorkout(
                    id: document.documentID,
                    muscleGroup: dbData["muscleGroup"] as? String ?? "",
                    exercises: parseExcercisesData(
                        data: dbData["exercises"] as? [[String: Any]] ?? [[:]]
                    ),
                    date: dbData["date"] as? String ?? ""
                )

                data.append(excercise)
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }

        return data
    }

    func addNewMuscleGroupWorkout(workout: MuscleGroupWorkout) async throws {

        // TODO: Also add the exercies into the exercises collection
        var exerciseDictionaries: [[String: Any]] = []
        
        
        for exc in workout.exercises {
            exerciseDictionaries.append(exc.toDictionary)
        }
        

        let query = db.collection("muscle_group_workouts")
            .whereField("date", isEqualTo: workout.date)
            .whereField("muscleGroup", isEqualTo: workout.muscleGroup)  // <-- Second where statement

        do {
            // 2. Execute the query to find matching documents
            let snapshot = try await query.getDocuments()

            if let existingDocument = snapshot.documents.first {
                // we found one, so just update it
                let docRef = existingDocument.reference
                try await docRef.updateData([
                    "exercises": FieldValue.arrayUnion(exerciseDictionaries)
                ])
                print("Successfully updated existing document.")

            } else {
                // None found, so create a new one
                let newDocRef = db.collection("muscle_group_workouts").document()
                try await newDocRef.setData([
                    "date": workout.date,
                    "muscleGroup": workout.muscleGroup,
                    "exercises": exerciseDictionaries
                ])
                print(
                    "Successfully created a new document with an empty array."
                )
            }

        } catch {
            print(
                "Error processing Firestore operation: \(error.localizedDescription)"
            )
        }
    }

    func removeExerciseFromWorkout(workoutId: String, exerciseName: String)
        async throws -> Void
    {
        // find the correct one to delete with the workoutId, and the exercise name
        // remove it also from the associated record in the 'exercises' db
    }
    
    func removeMuscleGroupWorkout(workoutId: String) async throws -> Void {
        // TODO: Also remove the exercies from the exercises collection. Remove it from the workouts collection

    }

    func parseExcercisesData(data: [[String: Any]]) -> [ExcerciseWorkout] {
        var exercises: [ExcerciseWorkout] = []

        let exerciseArray = data

        for exercise in exerciseArray {

            let name = exercise["name"] as? String ?? ""
            let location = exercise["location"] as? String ?? ""
            let muscleGroup = exercise["muscleGroup"] as? String ?? ""
            let sets = exercise["sets"] as? [String] ?? []

            exercises.append(
                ExcerciseWorkout(
                    name: name,
                    location: location,
                    muscleGroup: muscleGroup,
                    sets: sets,
                    isAddedIn: true
                )
            )

        }

        return exercises
    }

}
