//
//  Excercise.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import Foundation

struct MockExcData {
    let excerciseList: [ExcerciseWorkout] = [
        ExcerciseWorkout(
            name: "Hack Squat",
            location: "",
            muscleGroup: "Legs",
            sets: ["12"],
            isAddedIn: true
        ),
        ExcerciseWorkout(
            name: "Bulgarian Split Squat DB",
            location: "",
            muscleGroup: "Legs",
            sets: ["12", "1"],
            isAddedIn: true
        ),
        ExcerciseWorkout(
            name: "Leg Press",
            location: "By Front",
            muscleGroup: "Legs",
            sets: ["12"],
            isAddedIn: true
        ),
        ExcerciseWorkout(
            name: "Chin ups",
            location: "",
            muscleGroup: "Biceps",
            sets: ["12"],
            isAddedIn: true
        ),
    ]
}

struct ExcerciseWorkout: Hashable, Codable {
    var name: String
    var location: String
    var muscleGroup: String
    var sets: [String]
    var isAddedIn: Bool

    var toDictionary: [String: Any] {
        return [
            "name": name,
            "sets": sets,
            "location": location,
            "muscleGroup": muscleGroup,
        ]
    }
}
