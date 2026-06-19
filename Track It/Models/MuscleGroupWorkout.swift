//
//  MuscleGroupWorkout.swift
//  Track It
//
//  Created by Michael Knight on 6/7/26.
//
import Foundation
import FirebaseFirestore

let ex1 = ExcerciseWorkout(name: "Hack Squat", location: "", muscleGroup: "Legs", sets: ["12"], isAddedIn: true)
let ex2 = ExcerciseWorkout(name: "Bulgarian Split Squat DB", location: "", muscleGroup: "Legs", sets: ["12", "1"], isAddedIn: true)
let ex3 = ExcerciseWorkout(name: "Leg Press", location: "By Front", muscleGroup: "Legs", sets: ["12"], isAddedIn: true)
let ex4 = ExcerciseWorkout(name: "Chin ups", location: "", muscleGroup: "Biceps", sets: ["12"], isAddedIn: true)

struct MockMuscleGroupWorkout {
    var mockDataList: [MuscleGroupWorkout] = [
        MuscleGroupWorkout(
            id: "1",
            muscleGroup: "Shoulders",
            exercises: [ex1, ex2, ex3, ex4],
            date: "01/12/2026"
        )
    ]
}

struct MuscleGroupWorkout: Hashable, Codable, Identifiable {
    var id: String
    var muscleGroup: String
    var exercises: [ExcerciseWorkout]
    var date: String
}
