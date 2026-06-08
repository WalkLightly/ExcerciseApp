//
//  MuscleGroupWorkout.swift
//  Track It
//
//  Created by Michael Knight on 6/7/26.
//
import Foundation

let ex1 = ExcerciseWorkout(id: "1", name: "Hack Squat", location: "", muscleGroup: ["Legs"], sets: ["12"], isAddedIn: true)
let ex2 = ExcerciseWorkout(id: "2", name: "Bulgarian Split Squat DB", location: "", muscleGroup: ["Legs"], sets: ["12", "1"], isAddedIn: true)
let ex3 = ExcerciseWorkout(id: "3", name: "Leg Press", location: "By Front", muscleGroup: ["Legs"], sets: ["12"], isAddedIn: true)
let ex4 = ExcerciseWorkout(id: "4", name: "Chin ups", location: "", muscleGroup: ["Biceps"], sets: ["12"], isAddedIn: true)

struct MockMuscleGroupWorkout {
    var mockDataList: [MuscleGroupWorkout] = [
        MuscleGroupWorkout(
            id: "2",
            muscleGroup: "Shoulders",
            excercises: [ex1, ex2, ex3, ex4],
            date: Date()
        )
    ]
}

struct MuscleGroupWorkout: Hashable{
    var id: String
    var muscleGroup: String
    var excercises: [ExcerciseWorkout]
    var date: Date
}
