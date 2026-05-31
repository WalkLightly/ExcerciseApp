//
//  MuscleGroup.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//

import Foundation

struct MockMuscleGrpData {
    let muscleGroupList: [MuscleGroup] = [
        MuscleGroup(id: "1", name: "Legs", excercises: ["Leg Press"], color: "blue"),
        MuscleGroup(id: "2", name: "Triceps", excercises: ["Close Grip Bench"], color: "green"),
        MuscleGroup(id: "3", name: "Biceps", excercises: ["Chin ups"], color: "brown"),
    ]
}

struct MuscleGroup {
    var id: String
    var name: String
    var excercises: [String]
    var color: String
}
