//
//  ExcerciseType.swift
//  Track It
//
//  Created by Michael Knight on 6/7/26.
//
import Foundation
import FirebaseFirestore

struct SetsData: Codable {
    var sets: [String]
    var date: Timestamp
}

struct Excercise: Codable {
    var name: String
    var location: String
    var muscleGroup: String
    var startingWeight: String
    var startingWeightDate: Timestamp
    var workouts: [SetsData]
}
