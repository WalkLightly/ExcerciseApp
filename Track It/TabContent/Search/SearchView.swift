//
//  SearchView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = ExerciseCardViewModel()
    @FocusState var showTypeAhead: Bool
    
    @State var searchText: String = ""//DB Bulgarian Split Squat"
    @State var muscleGroup: String = ""
    @State var chosenResult: String = "" //DB Bulgarian Split Squat"
    @State private var exercises: [Excercise] = []
    @State private var resultIsMuscleGroup: Bool = true
    @State private var typeAheadResults: [String] = []
    @State private var measurements: [Measurement] = []
    @State private var startingWeight: String = ""
    let muscleGroups: [String] = ["Shoulders",
                                 "Legs",
                                 "Triceps",
                                 "Chest",
                                 "Back",
                                 "Biceps",
                                 "Cardio",
                                 "Abs",
                                 "Forearms"]
    @State private var totalSets: Int = 0
    @State private var daysWorkedOut: Int = 0
    
    
    var ex1Date: String = "10/2/2026"
    var ex2Date: String = "10/2/2026"
    var ex3Date: String = "10/2/2026"
    var ex4Date: String = "10/2/2026"
    var ex5Date: String = "10/2/2026"
    

    var ex1: [String] = ["1","200","34","40"]
    var ex2: [String] = ["1","200","34","40"]
    var ex3: [String] = ["1","200","34","40"]
    var ex4: [String] = ["1","200","34","40"]
    var ex5: [String] = ["1","200","34","40"]
    
    @State private var workouts: [MuscleGroupWorkout] = []
    

    func getHeightForMeasurements() -> CGFloat {
        if chosenResult == "Legs" {
            return CGFloat(180.0)
        }
        
        return CGFloat(0.0)
    }
    
    func getExcercisesForMuscleGroup() -> [Excercise] {
        return exercises.filter({ $0.muscleGroup == chosenResult})
    }
    
    func getMuscleGroupFromName(excerciseName: String) -> String {
        return exercises.filter({$0.name == excerciseName}).first?.muscleGroup ?? ""
    }
    
    func fetchData() async throws -> Void {
        typeAheadResults = muscleGroups
        workouts = try await viewModel.getAllWorkoutData()
        exercises = try await viewModel.getAllExercises()
        measurements = try await viewModel.getAllMeasurements()
        
        for ex in exercises {
            typeAheadResults.append(ex.name)
        }
        
       // getTotalSetsAndDaysForMuscleGroup()
        muscleGroup = getMuscleGroupFromName(excerciseName: chosenResult)
        getTotalSetsForExercise()
    }
    
    func getMeasurements() -> Void {
        print(measurements)
    }
    
    func getTotalSetsAndDaysForMuscleGroup() -> Void {
        totalSets = 0
        daysWorkedOut = 0
        for workout in workouts {
            if workout.muscleGroup == searchText {
                daysWorkedOut += 1
                for exercise in workout.exercises {
                    totalSets += exercise.sets.count
                }
            }
        }
        
    }
    
    func getTotalSetsForExercise() -> Void {
        totalSets = 0
        daysWorkedOut = 0
        startingWeight = exercises.filter({$0.name == chosenResult}).first?.startingWeight ?? ""
        for workout in workouts {
            if workout.muscleGroup == muscleGroup {
                daysWorkedOut += 1
                for exercise in workout.exercises {
                    if exercise.name == chosenResult {
                        totalSets += exercise.sets.count
                    }
                }
            }
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
                    HStack {
                        TextField("Search . . .", text: $searchText)
                            .frame(width: 340, height: 40)
                            .foregroundStyle(.grayBlue)
                            .font(.custom("Inder-Regular", size: 30))
                            .padding(.leading, 5)
                            .focused($showTypeAhead)
                        Image(systemName: "xmark")
                            .font(.system(size: 25))
                            .foregroundStyle(.cornflowerBlue)
                            .opacity(searchText == "" ? 0 : 1)
                            .onTapGesture {
                                searchText = ""
                                chosenResult = ""
                            }
                            .padding(.trailing, 5)
                    }
                    .padding(.top, showTypeAhead ? 70 : -15)
                    
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
                    if !resultIsMuscleGroup {
                        VStack(alignment: .leading) {
                            Text(chosenResult)
                                .font(.custom("PTSans-Narrow", size: 30))
                                .foregroundStyle(.black)
                                .padding(.leading, 20)
                            
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
                                .onTapGesture {
                                    chosenResult = muscleGroup
                                    showTypeAhead = false
                                    searchText = muscleGroup
                                    resultIsMuscleGroup = true
                                    getTotalSetsAndDaysForMuscleGroup()
                                    getMeasurements()
                                }
                                Spacer()
                            }
                            HStack {
                                Text("Last 5 workouts")
                                    .foregroundStyle(.black)
                                    .font(.custom("Poppins-Bold", size: 15))
                                    .padding(.leading, 20)
                                    .padding(.top, 30)
                                Text("\(daysWorkedOut)Total")
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
                                    
                                    Text("\(totalSets)")
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
                    } else {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack{
                                    
                                }
                                .frame(width: 10, height: 70)
                                .background(MuscleGroupColorMap[chosenResult])
                                .cornerRadius(10)
                                VStack {
                                    Text(chosenResult)
                                        .font(.custom("PTSans-Narrow", size: 60))
                                        .foregroundStyle(.black)
                                        .padding(.leading, 5)
                                        .padding(.top, 15)
                                }
                                .padding(.top, -25)
                            }
                            HStack {
                                Text("Exercises")
                                    .foregroundStyle(.black)
                                    .font(.custom("Poppins-Bold", size: 15))
                                    .padding(.leading, 5)
                                    .padding(.top, -35)
                            }
                            
                            
                            // ALL EXERCISES AND MEASUREMENTS
                            HStack {
                                ScrollView {
                                    LazyVStack {
                                        ForEach(getExcercisesForMuscleGroup(), id: \.self) { exc in
                                            HStack {
                                                Text(exc.name)
                                                    .foregroundStyle(.black)
                                                    .font(.custom("Inder-Regular", size: 20))
                                                Spacer()
                                                Text(exc.startingWeight)
                                                    .foregroundStyle(.black)
                                                    .font(.custom("Poppins-Bold", size: 15))

                                            }
                                            .frame(width: 200)
                                            .padding(.bottom, 5)
                                            .onTapGesture {
                                                chosenResult = exc.name
                                                resultIsMuscleGroup = false
                                                searchText = exc.name
                                                muscleGroup = getMuscleGroupFromName(excerciseName: chosenResult)
                                                getTotalSetsForExercise()
                                            }
                                        }
                                    }
                                }
                                .frame(width: 220, height: 370)
                                .background(.white)
//                                .cornerRadius(10)
//                                .shadow(
//                                    color: Color.black.opacity(0.6),
//                                    radius: 4,
//                                    x: 1,
//                                    y: 3
//                                )
                                VStack {
                                    VStack {
                                        Text("Measurements")
                                            .font(.custom("Poppins-Bold", size: 17))
                                            .foregroundStyle(.darkBlue)
                                            .padding(.top, 5)
                                        
                                        // MEASUREMENTS
                                        
                                        HStack {
                                            Text("Right Leg")
                                                .foregroundStyle(.brown)
                                                .font(.custom("Inder-Regular", size: 17))
                                            Spacer()
                                            Text("23")
                                                .foregroundStyle(.backgroundBlue)
                                                .font(.custom("Inder-Regular", size: 20))
                                            
                                        }.frame(width: 120)
                                        
                                        HStack {
                                            Text("Right Leg")
                                                .foregroundStyle(.brown)
                                                .font(.custom("Inder-Regular", size: 17))
                                            Spacer()
                                            Text("23")
                                                .foregroundStyle(.backgroundBlue)
                                                .font(.custom("Inder-Regular", size: 20))
                                            
                                        }.frame(width: 120)
                                        
                                        HStack {
                                            Text("Right Leg")
                                                .foregroundStyle(.brown)
                                                .font(.custom("Inder-Regular", size: 17))
                                            Spacer()
                                            Text("23")
                                                .foregroundStyle(.backgroundBlue)
                                                .font(.custom("Inder-Regular", size: 20))
                                            
                                        }.frame(width: 120)
                                        
                                        HStack {
                                            Text("Right Leg")
                                                .foregroundStyle(.brown)
                                                .font(.custom("Inder-Regular", size: 17))
                                            Spacer()
                                            Text("23")
                                                .foregroundStyle(.backgroundBlue)
                                                .font(.custom("Inder-Regular", size: 20))
                                            
                                        }.frame(width: 120)
                                        
                                        HStack {
                                            Text("Right Leg")
                                                .foregroundStyle(.brown)
                                                .font(.custom("Inder-Regular", size: 17))
                                            Spacer()
                                            Text("23")
                                                .foregroundStyle(.backgroundBlue)
                                                .font(.custom("Inder-Regular", size: 20))
                                            
                                        }.frame(width: 120)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 150, height: getHeightForMeasurements())
                                    .background(.white)
                                    .cornerRadius(3)
                                    .shadow(
                                        color: Color.black.opacity(0.6),
                                        radius: 2,
                                        x: 1,
                                        y: 2
                                    )
                                    Spacer()
                                }.frame(width: 150, height: 370)
                            }
                            .padding(.top, -20)
         
                          
                            HStack {
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
                                    
                                    Text("\(totalSets)")
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
                                    Text("Days Worked")
                                        .font(
                                            .custom(
                                                "Inder-Regular",
                                                size: 20
                                            )
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.top, 10)
                                    
                                    Text("\(daysWorkedOut)")
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
                                    if resultIsMuscleGroup {
                                        getTotalSetsAndDaysForMuscleGroup()
                                        getMeasurements()
                                    } else {
                                        // find the muscle group for the chosen exercise
                                        muscleGroup = getMuscleGroupFromName(excerciseName: chosenResult)
                                        getTotalSetsForExercise()
                                    }
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
