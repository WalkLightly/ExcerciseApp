//
//  SearchView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct SearchView: View {
    @FocusState var showTypeAhead: Bool
    @State var searchText: String = ""
    @State var muscleGroup: String = ""
    @State var chosenResult: String = ""
    @StateObject private var viewModel = ExerciseCardViewModel()
    @State private var exercises: [Excercise] = []
    @State private var resultIsMuscleGroup: Bool = false
    @State private var typeAheadResults: [String] = []
    let muscleGroups: [String] = ["Shoulders",
                                 "Legs",
                                 "Triceps",
                                 "Chest",
                                 "Back",
                                 "Biceps",
                                 "Cardio",
                                 "Abs",
                                 "Forearms"]
    
    var ex1Date: String = "10/2/2026"
    var ex2Date: String = "10/2/2026"
    var ex3Date: String = "10/2/2026"
    var ex4Date: String = "10/2/2026"
    var ex5Date: String = "10/2/2026"
    
    var startingWeight: String = "200"
    var totalSets: String = "1000"
    var daysWorkedOut: String = "20"

    var ex1: [String] = ["1","200","34","40"]
    var ex2: [String] = ["1","200","34","40"]
    var ex3: [String] = ["1","200","34","40"]
    var ex4: [String] = ["1","200","34","40"]
    var ex5: [String] = ["1","200","34","40"]

    
    func getMuscleGroupFromName(excerciseName: String) -> String {
        return exercises.filter({$0.name == excerciseName}).first?.muscleGroup ?? ""
    }
    
    func fetchData() async throws -> Void {
        typeAheadResults = muscleGroups
        exercises = try await viewModel.getAllExercises()
        
        for ex in exercises {
            typeAheadResults.append(ex.name)
        }
    }

    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            .frame(width: 500, height: 1500)
            VStack(alignment: .leading) {
                VStack {
                    TextField("Search . . .", text: $searchText)
                        .frame(width: 380, height: 40)
                        .foregroundStyle(.grayBlue)
                        .font(.custom("Inder-Regular", size: 30))
                        .padding(.leading, 5)
                        .padding(.top, showTypeAhead ? 70 : -15)
                        .focused($showTypeAhead)
                    
                    Rectangle()
                        .fill(.cornflowerBlue)
                        .frame(width: 380, height: 4)
                        .opacity(0.7)
                        .offset(y: -5)
                }
                .padding(.top, -40)
                if chosenResult == "" {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Search for an item above for more details")
                                .font(.custom("Poppins-Bold", size: 40))
                                .foregroundStyle(.grayBlue).opacity(0.5).multilineTextAlignment(.center)
                                .padding(.top, 100)
                        }
                        Spacer()
                    }.frame(width: 390, height: 600)
                        .padding(.top, 30)
                }
                else {
                    VStack(alignment: .leading) {
                        Text(chosenResult)
                            .font(.custom("PTSans-Narrow", size: 30))
                            .foregroundStyle(.black)
                            .padding(.leading, 20)
                        
                        if !resultIsMuscleGroup {
                            
                            HStack {
                                VStack {
                                    Text(getMuscleGroupFromName(excerciseName: chosenResult))
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundStyle(.black)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                }
                                .background(MuscleGroupColorMap[getMuscleGroupFromName(excerciseName: chosenResult)])
                                .cornerRadius(5)
                                .padding(.top, -15)
                                .padding(.leading, 20)
                                Spacer()
                            }
                        }
                        HStack {
                            Text("Last 5 workouts")
                                .foregroundStyle(.black)
                                .font(.custom("Poppins-Bold", size: 15))
                                .padding(.leading, 20)
                                .padding(.top, 30)
                            Text("35 Total")
                                .foregroundStyle(.grayBlue)
                                .font(.custom("Poppins-Bold", size: 15))
                                .padding(.leading, 20)
                                .padding(.top, 30)
                        }
                        
                        
                        // WORKOUT DATA LAST 5
                        
                        VStack(alignment: .leading) {
                            Text(ex1Date)
                                .font(
                                    .custom(
                                        "Inder-Regular",
                                        size: 13
                                    )
                                )
                                .foregroundStyle(.black)
                                .padding(.leading, 5)
                            HStack(spacing: 0) {
                                ForEach(ex1, id: \.self) {
                                    ex in
                                    VStack {
                                        Text(ex)
                                            .font(
                                                .custom(
                                                    "Inder-Regular",
                                                    size: 13
                                                )
                                            )
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 35, height: 25)
                                    .background(.brown)
                                    .cornerRadius(20)
                                    .padding(.leading, 5)
                                    
                                }
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.black.opacity(0.4),
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                        .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            Text(ex1Date)
                                .font(
                                    .custom(
                                        "Inder-Regular",
                                        size: 13
                                    )
                                )
                                .foregroundStyle(.black)
                                .padding(.leading, 5)
                            HStack(spacing: 0) {
                                ForEach(ex1, id: \.self) {
                                    ex in
                                    VStack {
                                        Text(ex)
                                            .font(
                                                .custom(
                                                    "Inder-Regular",
                                                    size: 13
                                                )
                                            )
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 35, height: 25)
                                    .background(.brown)
                                    .cornerRadius(20)
                                    .padding(.leading, 5)
                                    
                                }
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.black.opacity(0.4),
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                        .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            Text(ex1Date)
                                .font(
                                    .custom(
                                        "Inder-Regular",
                                        size: 13
                                    )
                                )
                                .foregroundStyle(.black)
                                .padding(.leading, 5)
                            HStack(spacing: 0) {
                                ForEach(ex1, id: \.self) {
                                    ex in
                                    VStack {
                                        Text(ex)
                                            .font(
                                                .custom(
                                                    "Inder-Regular",
                                                    size: 13
                                                )
                                            )
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 35, height: 25)
                                    .background(.brown)
                                    .cornerRadius(20)
                                    .padding(.leading, 5)
                                    
                                }
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.black.opacity(0.4),
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                        .padding(.leading, 20)
                        
                        
                        VStack(alignment: .leading) {
                            Text(ex1Date)
                                .font(
                                    .custom(
                                        "Inder-Regular",
                                        size: 13
                                    )
                                )
                                .foregroundStyle(.black)
                                .padding(.leading, 5)
                            HStack(spacing: 0) {
                                ForEach(ex1, id: \.self) {
                                    ex in
                                    VStack {
                                        Text(ex)
                                            .font(
                                                .custom(
                                                    "Inder-Regular",
                                                    size: 13
                                                )
                                            )
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 35, height: 25)
                                    .background(.brown)
                                    .cornerRadius(20)
                                    .padding(.leading, 5)
                                    
                                }
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.black.opacity(0.4),
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                        .padding(.leading, 20)
                        
                        
                        VStack(alignment: .leading) {
                            Text(ex1Date)
                                .font(
                                    .custom(
                                        "Inder-Regular",
                                        size: 13
                                    )
                                )
                                .foregroundStyle(.black)
                                .padding(.leading, 5)
                            HStack(spacing: 0) {
                                ForEach(ex1, id: \.self) {
                                    ex in
                                    VStack {
                                        Text(ex)
                                            .font(
                                                .custom(
                                                    "Inder-Regular",
                                                    size: 13
                                                )
                                            )
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 35, height: 25)
                                    .background(.brown)
                                    .cornerRadius(20)
                                    .padding(.leading, 5)
                                    
                                }
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.black.opacity(0.4),
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                        .padding(.leading, 20)
                        HStack {
                            VStack {
                                Text("Starting Weight")
                                    .font(
                                        .custom(
                                            "Inder-Regular",
                                            size: 20
                                        )
                                    )
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)
                                
                                Text(startingWeight)
                                    .font(
                                        .custom(
                                            "Inder-Regular",
                                            size: 30
                                        )
                                    )
                                    .foregroundStyle(.white)
                                    .padding(.top, -5)
                                    .padding(.bottom, 10)
                            }
                            .background(.darkBlue)
                            .cornerRadius(10)
                            .padding(.leading, 20)
                            VStack {
                                Text("Total Sets")
                                    .font(
                                        .custom(
                                            "Inder-Regular",
                                            size: 20
                                        )
                                    )
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)
                                
                                Text(totalSets)
                                    .font(
                                        .custom(
                                            "Inder-Regular",
                                            size: 30
                                        )
                                    )
                                    .foregroundStyle(.white)
                                    .padding(.top, -5)
                                    .padding(.bottom, 10)
                            }
                            .background(.darkBlue)
                            .cornerRadius(10)
                            .padding(.leading, 20)
                        }
                        .padding(.top, 50)
                        
                        
                    }.frame(width: 390, height: 650)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top, 30)
                        .shadow(
                            color: Color.black.opacity(0.6),
                            radius: 4,
                            x: 1,
                            y: 3
                        )
                }
            
            }
            if showTypeAhead {
                ScrollView {
                    ForEach(typeAheadResults, id: \.self) { result in
                        if searchText == "" || result.lowercased().contains(searchText.lowercased()) {
                            Text(result)
                                .font(.custom("Inder-Regular", size: 20))
                                .foregroundStyle(.black)
                                .frame(width: 250, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, 5)
                                .onTapGesture {
                                    chosenResult = result
                                    showTypeAhead = false
                                    searchText = result
                                    resultIsMuscleGroup = muscleGroups.contains(result)
                                    
                                }
                        }
                    }
                }
                .frame(width: 250, height: 200)
                .background(.white)
                .cornerRadius(10)
                .offset(x: -64, y: chosenResult == "" ? -180 :  -205)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 1, y: 4)
            }
        }
        .onAppear {
            showTypeAhead = false
            
            Task {
                try await fetchData()
            }
        }
        .onTapGesture {
            showTypeAhead = false
        }
    }
}

#Preview {
    SearchView()
}
