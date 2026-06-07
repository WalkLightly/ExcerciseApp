//
//  WorkoutDayExercise.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct WorkoutDayExerciseView: View {
    let addNewSet: () -> Void
    @Binding var excercise: String
    @State var sets: [String]
    @State var showModal: Bool = true

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(excercise)
                        .font(
                            .custom("Inder-Regular", size: 18)
                        )
                        .foregroundStyle(.darkBlue)
                        .padding(.leading, 10)
                        .padding(.top, 10)
                    Spacer()
                    Button {
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
                Spacer()
                HStack(spacing: 30) {
                    HStack(spacing: 0) {
                        ForEach(sets, id: \.self) {
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
                        addNewSet()//sets.append("90")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.darkBlue)
                            .font(.system(size: 20))
                    }
                    //Spacer()
                }
                .padding(.bottom, 10)
            }
            .frame(width: 320, height: 70)
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
        }
    }
}

#Preview {
    WorkoutDayExerciseView(
        addNewSet: {},
        excercise: .constant("Romanian DeadLift"),
        sets: ["25", "30", "35"]
    )
}
