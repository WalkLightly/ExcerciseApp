//
//  ExerciseCardViewModel.swift
//  Track It
//
//  Created by Michael Knight on 7/31/26.
//
import Foundation
import Observation
internal import Combine

class ExerciseCardViewModel: ObservableObject  {
    @Published var exercises: [Excercise] = []
    
    func getAllExercises() async throws -> [Excercise] {
        var exercises: [Excercise] = []
        do {
            exercises = try await ExcercisesAPI.shared.getAllExcercises()
        }
        
        return exercises
    }
}
