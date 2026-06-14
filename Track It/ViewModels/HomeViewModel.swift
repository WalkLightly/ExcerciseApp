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
    @Published var isLoadingData: Bool = false
    
    func getWorkoutsForToday(date: String) async throws -> [MuscleGroupWorkout] {
        self.isLoadingData = true
        
        do {
            self.exercisesForToday = try await MuscleGroupWorkoutsAPI.shared.getAllMuscleGroupWorkoutsForDate(date: date)
            self.isLoadingData = false
        } catch {
            print("error fetching workouts")
        }
        
        return self.exercisesForToday
    }
}
    
