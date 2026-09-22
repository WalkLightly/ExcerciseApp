//
//  ExcerciseDayMuscleGroup.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct WorkoutDayMuscleGroupView: View {

    @StateObject private var viewModel = HomeViewModel()

    @State private var isExpanded = false
    let addNewSet: (String, String) -> Void
    @Binding var muscleGroup: String
    @Binding var excercises: [ExcerciseWorkout]
    @State var muscleGroupWorkoutId: String
    let deleteMuscleGroupWorkout: (String) -> Void

    @State private var isEditing = false
    @State private var workoutToDeleteId: String = ""
    @State private var newExcerciseName: String = ""
    @Binding var allExercises: [Excercise]

    func deleteExcercise() {
        //excercises.remove(atOffsets: offsets)
        isEditing = false
    }

    var body: some View {
                        
        HStack(alignment: .top) {
            VStack {
                Spacer()
                Rectangle()
                    .fill(MuscleGroupColorMap[muscleGroup] ?? .darkBlue)
                    .frame(width: 20, height: 430)
                    .cornerRadius(20)
                    .padding(.leading, 10)
                Spacer()
            }
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text(muscleGroup)
                            .font(.custom("PTSans-Narrow", size: 35))
                            .foregroundStyle(.white)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                    .background(.darkBlue)
                    .cornerRadius(5)
                    .padding(5)
                    Spacer()
                    Button {
                        excercises.insert(
                            ExcerciseWorkout(
                                name: newExcerciseName,
                                location: "",
                                muscleGroup: muscleGroup,
                                sets: [],
                                isAddedIn: false
                            ),
                            at: 0
                        )
                    } label: {
                        Text("Add")
                            .font(.custom("PTSans-NarrowBold", size: 25))
                            .foregroundStyle(.skyBlue)
                    }
                    .padding(.top, 5)
                    .padding(.trailing, 15)
                }
                ScrollView {
                    // List {
                    ForEach($excercises, id: \.self) {
                        $excercise in
                        if excercise.isAddedIn {
                            WorkoutDayExerciseView(
                                addNewSet: addNewSet,
                                excercise: $excercise,
                                muscleGroupWorkoutId: muscleGroupWorkoutId
                            )
                        } else {
                            VStack {
                                HStack {
                                    VStack {
                                        Menu {
                                            ForEach(allExercises.filter{ $0.muscleGroup == muscleGroup}, id: \.self) { exer in
                                                Button {
                                                    newExcerciseName = exer.name
                                                } label: {
                                                    Text(exer.name)
                                                }
                                            }
                                        } label: {
                                            HStack {
                                                Text(newExcerciseName)
                                                    .frame(height: 40)
                                                    .foregroundStyle(.black)
                                                    .font(
                                                        .custom("Inder-Regular", size: 18)
                                                    )
                                                Spacer()
                                            }
                                            .frame(width: 300)
                                            .padding(.leading, 10)
                                        }
                                    }
                                    .frame(
                                        width: 300,
                                        height: 30
                                    )
                                    .background(
                                        Color.gray.brightness(
                                            0.30
                                        )
                                    )
                                    .foregroundStyle(.darkBlue)
                                    .cornerRadius(10)
                                    .padding(.leading, 5)
                                    .padding(.top, 5)
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    HStack(spacing: 30) {
                                        Button {
                                            excercises
                                                .removeFirst()
                                            newExcerciseName =
                                            ""
                                        } label: {
                                            Text("Cancel")
                                                .font(
                                                    .custom(
                                                        "Inder-Regular",
                                                        size: 18
                                                    )
                                                )
                                                .foregroundStyle(
                                                    .red
                                                )
                                        }
                                        Button {
                                            print(muscleGroupWorkoutId)
//                                            excercise.isAddedIn = true
//                                            excercise.name = newExcerciseName
//                                            newExcerciseName = ""
                                            
                                            // PAS THIS TO THE VIEW MODEL, ALONG WITH THE MUSCLEGROUPWORKOUTID
                                            // ExcerciseWorkout(
                                        //    name: newExcerciseName,
                                        //    location: "",
                                        //    muscleGroup: newMuscleGroup,
                                        //    sets: [],
                                        //    isAddedIn: false
                                            
                                            // NEW METHOD CALLED ADD EXCERCISE TO WORKOUT MUSCLE GROUP
                                            //   ExcerciseWorkout(
//                                            name: "Hack Squat",
//                                            location: "",
//                                            muscleGroup: "Legs",
//                                            sets: ["12"],
//                                            isAddedIn: true
//                                        ),
                                            
                                           // newMuscleGroup = "Muscle Group"
                                            //newExcercises = []
                                            
//                                            Task {
//                                                
//                                                try await viewModel.addNewWorkoutDay(workout: newMuscleGroupWorkout)
//                                                
//                                                // try await viewModel.getWorkoutsForDate(date: selectedDate)
//                                            }
                                        } label: {
                                            Text("Save")
                                                .font(
                                                    .custom(
                                                        "Inder-Regular",
                                                        size: 18
                                                    )
                                                )
                                                .foregroundStyle(
                                                    newExcerciseName
                                                    != ""
                                                    ? .blue
                                                    : .gray
                                                )
                                            
                                        }
                                        .disabled(
                                            newExcerciseName
                                            == ""
                                        )
                                    }
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 5)
                                }
                            }
                            .frame(width: 330, height: 70)
                            .background(
                                excercise.isAddedIn
                                ? .white : .offWhite
                            )
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),
                                radius: 2,
                                x: 1,
                                y: 2
                            )
                            .padding(.trailing, 5)
                            .padding(.leading, 5)
                            .padding(.top, 5)
                        }

                    }
                    //   .onDelete(perform: deleteExcercise)
                }
                //.scrollContentBackground(.hidden)
                // .listStyle(.plain)
                // }
                .padding(.top, 5)
                .padding(.bottom, 20)
            }
        
           
            Spacer()

        }
        .frame(width: 380, height: 450)

        .background(.offWhite)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 10,
                bottomLeadingRadius: 10,
                bottomTrailingRadius: 10,
                topTrailingRadius: 10
            )
        )
        .shadow(
            color: Color.black.opacity(0.7),
            radius: 5,
            x: 1,
            y: 2
        )
        .padding()
        .onLongPressGesture(minimumDuration: 0.5) {
            // This triggers after the full hold duration
            withAnimation {
                self.isEditing = true
            }
        }
        .overlay(alignment: .topTrailing) {
            if isEditing {
                Button(action: deleteExcercise) {
                    Text("DELETE")
                        .font( .custom(
                            "PTSans-NarrowBold",
                            size: 20
                        ))
                      
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                }
                .transition(.scale.combined(with: .opacity)) // Animate it popping in
                .background(.red.opacity(0.5))
                .cornerRadius(10)
                .offset(x: -105, y: 25)

            }
        }
        .onTapGesture {
            isEditing = false
        }
    }
}

#Preview {
    WorkoutDayMuscleGroupView(
        addNewSet: { _, _ in },
        muscleGroup: .constant("Shoulders"),
        excercises: .constant([]),
        muscleGroupWorkoutId: "",
        deleteMuscleGroupWorkout: { _ in },
        allExercises: .constant([])
    )
}
