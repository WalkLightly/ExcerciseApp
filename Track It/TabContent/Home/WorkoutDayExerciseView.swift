//
//  WorkoutDayExercise.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct WorkoutDayExerciseView: View {
    @StateObject private var viewModel = HomeViewModel()
    let addNewSet: (String, String) -> Void
    @State var showModal: Bool = true
    @Binding var excercise: ExcerciseWorkout
    @State var muscleGroupWorkoutId: String
    
    @State private var excercisesList: [Excercise] = []

    func getStartingWeightForExcercise(name: String) -> String {
        return excercisesList.first(where: { $0.name == name})?.startingWeight ?? ""
    }
    
    func getStartingWeightDateForExcercise(name: String) -> String {
        return excercisesList.first(where: { $0.name == name})?.startingWeightDate ?? ""
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HStack {
                        Text(excercise.name)
                            .font(
                                .custom("Inder-Regular", size: 18)
                            )
                            .foregroundStyle(.darkBlue)
                            .padding(.leading, 10)
                            .padding(.top, 10)
                        
                    }
                    Spacer()
                    Button {
                        print(muscleGroupWorkoutId)
                        print(excercise.name)
                    } label: {
                        Image(
                            systemName:
                                "trash"
                        )
                        .font(.system(size: 20))
                        .foregroundStyle(.red.opacity(0.5))
                        .padding(.top, 15)
                        .padding(.trailing, 5)
                    }
                }
                HStack {
                    VStack {
                        Text(getStartingWeightForExcercise(name: excercise.name))
                            .font(
                                .custom("Inder-Regular", size: 18)
                            )
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 10)
                    }
                    .frame(height: 30)
                    .background(.darkBlue)
                    .padding(.leading, 15)
                    VStack {
                        Text(getStartingWeightDateForExcercise(name: excercise.name))
                            .font(
                                .custom("Inder-Regular", size: 18)
                            )
                            .foregroundStyle(.darkBlue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 10)
                    }
                    .frame(height: 30)
                    .padding(.leading, 15)
                    
                    Spacer()
                }
                .padding(.top, -10)
                .padding(.bottom, 10)
                .onTapGesture {
                    
                }
                HStack(spacing: 30) {
                    HStack(spacing: 0) {
                        ForEach(excercise.sets, id: \.self) {
                            excerciseSet in
                            VStack {
                                Text(excerciseSet)
                                    .font(
                                        .custom(
                                            "Inder-Regular",
                                            size: 18
                                        )
                                    )
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 50, height: 30)
                            .background(.brown)
                            .cornerRadius(20)
                            .padding(.leading, 5)
                            
                        }
                        Spacer()
                    }
                    .frame(width: 250, height: 35)
                    Button {
                        addNewSet(muscleGroupWorkoutId, excercise.name)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.darkBlue)
                            .font(.system(size: 20))
                    }
                    //Spacer()
                }
                .padding(.bottom, 10)
            }
            .frame(width: 320, height: 130)
            .background(.white)
            .cornerRadius(10)
            .shadow(
                color: Color.black.opacity(0.4),
                radius: 2,
                x: 1,
                y: 2
            )
            .padding(.trailing, 10)
            .padding(.leading, 10)
            .padding(.bottom, 5)
        }.onAppear {
            Task {
                excercisesList = try await viewModel.getAllExercises()
            }
        }
    }
}

#Preview {
    WorkoutDayExerciseView(
        addNewSet: {_, _ in },
        excercise: .constant(ex2),
        muscleGroupWorkoutId: ""
    )
}
