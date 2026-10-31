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
    @Published var exercisesMasterList: [MuscleGroupWorkout] = []
    
    func getAllExercises() async throws -> [Excercise] {
        var exercises: [Excercise] = []
        do {
            exercises = try await ExcercisesAPI.shared.getAllExcercises()
        }
        
        return exercises
    }
    
    func getAllWorkoutData() async throws -> [MuscleGroupWorkout] {
        do {
            self.exercisesMasterList = try await MuscleGroupWorkoutsAPI.shared.getAllMuscleGroupWorkouts()
        } catch {
            print("error fetching workouts")
        }
        
        return self.exercisesMasterList
    }
    
    func getAllMeasurements() async throws -> [Measurement] {
        var measurements: [Measurement] = []
        
        do {
            measurements = try await WeightAPI.shared.getCurrentMeasurements()
        } catch {
            print("error fetching workouts")
        }
        
        return measurements
    }
}
