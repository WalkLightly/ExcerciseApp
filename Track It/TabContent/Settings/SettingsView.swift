//
//  SettingsView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct SettingsView: View {
    
    var MuscleGroups: [String] = [
        "Shoulders",
        "Legs",
        "Triceps",
        "Chest",
        "Back",
        "Biceps",
        "Cardio",
        "Abs",
        "Forearms"
    ]
    
    @StateObject private var viewModel = ExerciseCardViewModel()
    @State private var exercises: [Excercise] = []
    @State private var showEditModal: Bool = false
    @State private var chosenExName: String = ""
    @State private var chosenExWeight: String = ""

    
    func fetchData() async throws -> Void {
        exercises = try await viewModel.getAllExercises()
    }
    
    func filterExcercises(muscle: String) -> [Excercise] {
        let ex = exercises.filter { $0.muscleGroup == muscle}
        print(ex)
        return ex
    }
    
    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            .frame(width: 500, height: 1500)
            VStack {
                Text("Settings")
                    .font(.custom("PTSans-Narrow", size: 55))
                    .padding(.top, 20)
                    .padding(.leading, -200)
                    .foregroundStyle(.black)
                ScrollView {
                    LazyVStack (spacing: 12) {
                        ForEach(MuscleGroups, id: \.self) { muscle in
                            VStack {
                                DisclosureGroup {
                                    ForEach(filterExcercises(muscle: muscle), id: \.self) { excercise in
                                        HStack {
                                            Text(excercise.name)
                                                .font(.custom("Poppins-Regular", size: 20))
                                                .onTapGesture {
                                                    showEditModal = true
                                                    chosenExName = excercise.name
                                                    chosenExWeight = excercise.startingWeight
                                                }
                                                .foregroundStyle(.black)

                                            Spacer()
                                            Text(excercise.startingWeight)
                                                .font(.custom("Poppins-Bold", size: 25))
                                                .foregroundStyle(.black)
                                        }
                                        .padding(.bottom, 2)
                                    }
                                } label: {
                                    HStack {
                                        VStack {
                                            Rectangle()
                                                .fill(MuscleGroupColorMap[muscle] ?? .darkBlue)
                                                .frame(width: 10, height: 10)
                                                .cornerRadius(20)
                                                .padding(.leading, -2)
                                        }
                                        Text("\(muscle)")
                                            .font(.custom("Poppins-Bold", size: 30))
                                            .fontWeight(.bold)
                                            .foregroundStyle(.cornflowerBlue)
                                    }
                                    .frame(height: 60)
                                    
                                }
                                .frame(width: 380)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                            }
                            .frame(width: 400)
                            .background(.white)
                            .cornerRadius(10)
                            .listRowBackground(Color.clear)
                            
                        }
                        .frame(width: 400)
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                }
                .frame(width: 500, height: 700)
            }
            
            if showEditModal {
                EditExcerciseDetailsModalView(name: $chosenExName, startingWeight: $chosenExWeight, showEditModal: $showEditModal, updateDetails: {})
            }

        }
        .task {
            do {
                try await fetchData()
            } catch {
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
