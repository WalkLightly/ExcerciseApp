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

    func deleteExcercise(at offsets: IndexSet) {
        excercises.remove(atOffsets: offsets)
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .fill(MuscleGroupColorMap[muscleGroup] ?? .darkBlue)
                .frame(width: 20)
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
                            WorkoutDayExerciseView(addNewSet: addNewSet, excercise: $excercise)
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
                topLeadingRadius: 0,
                bottomLeadingRadius: 0,
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
    }
}

#Preview {
    WorkoutDayMuscleGroupView(
        addNewSet: {},
        muscleGroup: .constant("Shoulders"),
        excercises: .constant([])
    )
}
