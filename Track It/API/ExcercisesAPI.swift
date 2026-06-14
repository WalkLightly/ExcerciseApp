import FirebaseFirestore
//
//  ExcercisesAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/13/26.
//
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
                    let exercise = try document.data(as: Excercise.self)
                    excercises.append(exercise)

                } catch {
                    print("Error decoding a specific document: \(error)")
                }
            }
        } catch {
            print("Error fetching collection: \(error.localizedDescription)")
        }

        return excercises

        //        do {
        //            let querySnapshot = try await db.collection("exercises")
        //                .getDocuments()
        //
        //            for document in querySnapshot.documents {
        //                let excerciseData = document.data()
        //
        //                var setsData =  excerciseData["workouts"]
        //
        //                print(setsData)
        //
        //                let excercise = Excercise(
        //                    id: document.documentID,
        //                    name: excerciseData["name"] as? String ?? "",
        //                    location: excerciseData["location"] as? String ?? "",
        //                    muscleGroup: excerciseData["muscleGroup"] as? String ?? "",
        //                    startingWeight: excerciseData["startingWeight"] as? String ?? "",
        //                    startingWeightDate: excerciseData["startingWeightDate"] as? Timestamp ?? Timestamp(),
        //                    sets: excerciseData["workouts"] as? [SetsData] ?? [],
        //                )
        //
        //                excercises.append(excercise)
        //            }
        //            //}
        //            print(excercises)
        //        } catch {
        //            print("Error getting excercises: \(error)")
        //        }
    }
}
