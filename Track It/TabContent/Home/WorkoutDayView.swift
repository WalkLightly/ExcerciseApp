//
//  ExcerciseDay.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct MockExc : Hashable {
    var id: String
    var msclGroup: String
    var mockExcercises: [String]
}

struct WorkoutDayView: View {
    let addNewSet: () -> Void
    let addNewMuscleGroup: () -> Void
    @Binding var workoutData: [MuscleGroupWorkout]
    
    var body: some View {
        VStack {
            HStack {
                Text("Excercises for the day")
                    .font(.custom("PTSans-NarrowBold", size: 35))
                    .padding(.top, 5)
                    .padding(.leading, 20)
                Spacer()
                Button {
                    addNewMuscleGroup()// excerciseList.insert( MockExc(id: "3", msclGroup: "Arms", mockExcercises: ["Leg Curls", "Leg Press", "Bulgarian Split Squat"]), at: 0)
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.darkBlue)
                        .font(.system(size: 40))
                }
                .padding(.top, 5)
                .padding(.trailing, 15)
            }
            ScrollView {
                ForEach($workoutData, id: \.self) {
                    $exc in
                    HStack(alignment: .top) {
                        WorkoutDayMuscleGroupView(addNewSet: addNewSet, muscleGroup: $exc.muscleGroup, excercises: $exc.exercises)
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
        }
        .frame(width: 400, height: 500)
        .background(.cornflowerBlue)
        .cornerRadius(10)
        .shadow(
            color: .white.opacity(0.9),  // Soft, subtle shadow color
            radius: 4,  // Blur radius
            x: 0,  // Horizontal offset
            y: 0  // Vertical offset (pushes shadow down)
        )
    }
}

#Preview {
    WorkoutDayView(addNewSet: {}, addNewMuscleGroup: {}, workoutData: .constant([]))
}
