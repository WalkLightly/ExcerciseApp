//
//  ExcerciseDayMuscleGroup.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct WorkoutDayMuscleGroup: View {

    @Binding var muscleGroup: String
    @Binding var excercises: [String]

    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .fill(.shouldersAccent)
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

                    } label: {
                        Text("Add")
                        .font(.custom("PTSans-NarrowBold", size: 25))
                        .foregroundStyle(.skyBlue)

//                        Image(systemName: "plus")
//                            .foregroundStyle(.darkBlue)
//                            .font(.system(size: 30))
                    }
                    .padding(.top, 5)
                    .padding(.trailing, 15)
                }
                ScrollView {
                    ForEach(excercises, id: \.self) {
                        excercise in
                        VStack {
                            HStack {
                                Text(excercise)
                                    .font(
                                        .custom("Inder-Regular", size: 18)
                                    )
                                    .foregroundStyle(.darkBlue)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            Spacer()
                            HStack(spacing: 30) {
                                HStack(spacing: 0) {
                                    VStack {
                                        Text("13")
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
                                    VStack {
                                        Text("5")
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
                                    Spacer()

                                }
                                .frame(width: 250, height: 35)
                                Button {

                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundStyle(.darkBlue)
                                        .font(.system(size: 20))
                                }
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
    WorkoutDayMuscleGroup(
        muscleGroup: .constant("Shoulders"),
        excercises: .constant(["Romanian Dead Lift", "Leg Press", "Lunges"])
    )
}
