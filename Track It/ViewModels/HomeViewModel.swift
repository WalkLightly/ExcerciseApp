//
//  HomeViewModel.swift
//  Track It
//
//  Created by Michael Knight on 6/14/26.
//

import Foundation
import Observation
internal import Combine

class HomeViewModel: ObservableObject {
    @Published var exercisesForToday: [MuscleGroupWorkout] = []
    @Published var exercisesMasterList: [MuscleGroupWorkout] = []
    @Published var isLoadingData: Bool = false
    
    
    func getAllExercises() async throws -> [Excercise] {
        var exercises: [Excercise] = []
        do {
            exercises = try await ExcercisesAPI.shared.getAllExcercises()
        }
        
        return exercises
    }
    
    func updateStartingWeightForExcercise(name: String, newWeight: String) async throws -> Void {
        do {
            try await ExcercisesAPI.shared.updateStartingWeight(exerciseName: name, newWeight: newWeight)
        }
    }
    
    func getWorkoutsForDate(date: String) async throws -> [MuscleGroupWorkout] {
        self.isLoadingData = true
        
        do {
            self.exercisesForToday = try await MuscleGroupWorkoutsAPI.shared.getAllMuscleGroupWorkoutsForDate(date: date)
            self.isLoadingData = false
        } catch {
            print("error fetching workouts")
        }
        
        return self.exercisesForToday
    }
    
    func addNewWorkoutDay(workout: MuscleGroupWorkout) async throws -> Void {
        
        do {
            try await MuscleGroupWorkoutsAPI.shared.addNewMuscleGroupWorkout(workout: workout)
        } catch {
            print("Error adding workout BOI")
        }
    }
    
    func getAllWorkoutData() async throws -> [MuscleGroupWorkout] {
        do {
            self.exercisesMasterList = try await MuscleGroupWorkoutsAPI.shared.getAllMuscleGroupWorkouts()
        } catch {
            print("error fetching workouts")
        }
        
        return self.exercisesMasterList
    }
    
    func addSetToWorkout(muscleGroupWorkoutId: String, excerciseName: String, setWeight: String) async throws -> Void {
        do {
            try await MuscleGroupWorkoutsAPI.shared.addSetToWorkout(muscleGroupWorkoutId: muscleGroupWorkoutId, excerciseName: excerciseName, setWeight: setWeight)
        } catch {
            print("error fetching workouts")
        }
    }
    
    func getCurrentMeasurements() async throws -> [Measurement] {
        do {
            let m = try await WeightAPI.shared.getCurrentMeasurements()
            print(m.count)
            return m//try await WeightAPI.shared.getCurrentMeasurements()
        } catch {
            print("error fetching workouts")
            return []
        }
    }
}
    
