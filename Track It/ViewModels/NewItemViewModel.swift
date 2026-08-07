//
//  NewItemViewModel.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import Foundation
import Observation
internal import Combine

class NewItemViewModel : ObservableObject {
    @Published var weights: [Weight] = []
    
    func getAllWeights() async throws -> [Weight] {
        var weights: [Weight] = []
           
        do {
            weights = try await WeightAPI.shared.getWeights()
        }
        
        return weights
    }
    
    func addWeight(weight: String) async throws -> Void {
        do {
            try await WeightAPI.shared.addWeight(weight: weight)
        }
    }
    
    func addMeasurement(bodyPart: String, measurement: String) async throws -> Void {
        do {
            try await WeightAPI.shared.addMeasurement(bodyPart: bodyPart, measurement: measurement)
        }
    }
    
    func addExcercise(name: String, location: String, muscleGroup: String) async throws -> Void {
        do {
            try await ExcercisesAPI.shared.addExcercise(name: name, location: location, muscleGroup: muscleGroup)
        }
    }
}
