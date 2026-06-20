//
//  ExcerciseDayMuscleGroup.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct WorkoutDayMuscleGroupView: View {

    let addNewSet: () -> Void
    @Binding var muscleGroup: String
    @Binding var excercises: [ExcerciseWorkout]
    let docId: String
    let deleteMuscleGroupWorkout: (String) -> Void

    @State private var isEditing = false
    @State private var workoutToDeleteId: String = ""

    func deleteExcercise() {
        //excercises.remove(atOffsets: offsets)
        print(docId)
        isEditing = false
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Spacer()
                Rectangle()
                    .fill(MuscleGroupColorMap[muscleGroup] ?? .darkBlue)
                    .frame(width: 20, height: 280)
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
                        //  excercises.insert("Calf Raises", at: 0)
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
                        WorkoutDayExerciseView(
                            addNewSet: addNewSet,
                            excercise: $excercise
                        )
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
        .frame(width: 380, height: 300)

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
        addNewSet: {},
        muscleGroup: .constant("Shoulders"),
        excercises: .constant([]),
        docId: "",
        deleteMuscleGroupWorkout: { _ in }
    )
}
