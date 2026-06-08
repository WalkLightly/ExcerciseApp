//
//  Excercise.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import Foundation

struct MockExcData {
    let excerciseList: [ExcerciseWorkout] = [
        ExcerciseWorkout(id: "1", name: "Hack Squat", location: "", muscleGroup: ["Legs"], sets: ["12"], isAddedIn: true),
        ExcerciseWorkout(id: "2", name: "Bulgarian Split Squat DB", location: "", muscleGroup: ["Legs"], sets: ["12", "1"], isAddedIn: true),
        ExcerciseWorkout(id: "3", name: "Leg Press", location: "By Front", muscleGroup: ["Legs"], sets: ["12"], isAddedIn: true),
        ExcerciseWorkout(id: "4", name: "Chin ups", location: "", muscleGroup: ["Biceps"], sets: ["12"], isAddedIn: true),
    ]
}

struct ExcerciseWorkout: Hashable {
    var id: String
    var name: String
    var location: String
    var muscleGroup: [String]
    var sets: [String]
    var isAddedIn: Bool
}
