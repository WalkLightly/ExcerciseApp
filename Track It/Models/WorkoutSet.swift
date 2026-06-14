//
//  WorkoutSet.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//

import Foundation
import FirebaseFirestore

struct WorkoutSet {
    var id: String
    var date: String
    var muscleGroup: String
    var reps: Int
    var weight: String
    var excercisePerformed: String
}
