//
//  MuscleGroup.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//

import Foundation

struct MockMuscleGrpData {
    let muscleGroupList: [MuscleGroup] = [
        MuscleGroup(id: "1", name: "Legs", excercises: ["Leg Press"]),
        MuscleGroup(id: "2", name: "Triceps", excercises: ["Close Grip Bench"]),
        MuscleGroup(id: "3", name: "Biceps", excercises: ["Chin ups"])
    ]
}

struct MuscleGroup {
    var id: String
    var name: String
    var excercises: [String]
}
