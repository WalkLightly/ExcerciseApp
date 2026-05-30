//
//  Excercise.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import Foundation

struct MockExcData {
    let excerciseList: [Excercise] = [
        Excercise(id: "1", name: "Hack Squat", location: "", muscleGroup: ["Legs"]),
        Excercise(id: "2", name: "Bulgarian Split Squat DB", location: "", muscleGroup: ["Legs"]),
        Excercise(id: "3", name: "Leg Press", location: "By Front", muscleGroup: ["Legs"]),
        Excercise(id: "4", name: "Chin ups", location: "", muscleGroup: ["Biceps"]),
        Excercise(id: "5", name: "Close Grip Bench", location: "", muscleGroup: ["Triceps"]),
    ]
}

struct Excercise {
    var id: String
    var name: String
    var location: String
    var muscleGroup: [String]
}
