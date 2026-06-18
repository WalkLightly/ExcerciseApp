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

        //print(data)

        return data
    }

    func removeExerciseFromWorkout(workoutId: String, exerciseName: String)
        async throws
    {
        // find the correct one to delete with the workoutId, and the exercise name
        // remove it also from the associated record in the 'exercises' db
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
