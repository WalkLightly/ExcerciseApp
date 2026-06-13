//
//  HomeView.swift
//  Track It
//
//  Created by Michael Knight on 5/27/26.
//

import SwiftUI

struct AddingNewExcercise: Hashable {
    var name: String
    var addedIn: Bool
    var sets : [String] = []
}

var MuscleGroupColorMap: [String: Color] = [
    "Shoulders": .shouldersAccent,
    "Legs": .legsAccent,
    "Triceps": .tricepsAccent,
    "Chest": .chestAccent,
    "Back": .backAccent,
    "Biceps": .bicepsAccent,
    "Cardio": .cardioAccent,
    "Abs": .absAccent,
    "Muscle Group": .black,
]


struct HomeView: View {
    @State private var dateHolder = DateHolder()
    
    @State private var data: [MuscleGroupWorkout] = [
        MuscleGroupWorkout(
            id: "s1",
            muscleGroup: "Shoulders",
            excercises: [ex1, ex2, ex3, ex4],
            date: Date()
        ),
        MuscleGroupWorkout(
            id: "l3",
            muscleGroup: "Legs",
            excercises: [ex3, ex4],
            date: Date()
        ),
    ]

    @State private var tab: String = "home"
    @State private var xOffset = -116
    @State private var stopWatchActive: Bool = false
    @State private var newSetWeight: String = ""

    @State private var showAddSetModal: Bool = false
    @State private var showAddExerciseModal: Bool = false
    @State private var showAddWorkoutDayMuscleGroup: Bool = false

    @State private var newMuscleGroup: String = "Muscle Group"
    @State private var newExcercises: [ExcerciseWorkout] = []
        //AddingNewExcercise(name: "test", addedIn: true) ]
    @State private var newExcerciseName: String = ""
    @State private var showMuscleGroupDropdown: Bool = false

    @StateObject private var stopwatch = Stopwatch()

   

    var timeString: String {
        let minutes = Int(stopwatch.counter) / 60
        let seconds = Int(stopwatch.counter) % 60
        let milliseconds = Int(
            (stopwatch.counter.truncatingRemainder(dividingBy: 1)) * 100
        )

        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }

    // toggle modal buttons
    func addNewSet() { showAddSetModal = true }
    func addNewMuscleGroup() { showAddWorkoutDayMuscleGroup = true }
    func addNewExcercise() { showAddExerciseModal = true }

    var body: some View {
        ZStack {
            Color(.backgroundBlue)
            VStack {
                ZStack {
                    VStack {

                    }
                    .frame(width: 345, height: 30)
                    .background(.skyBlue)
                    .cornerRadius(18)
                    .offset(y: 100)
                    HStack {
                        Button {
                            stopwatch.reset()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .font(.system(size: 30))
                                .foregroundStyle(.accentGrey)
                        }
                        .frame(width: 60, height: 60)
                        .background(.accentGrey.opacity(0.5))
                        .clipShape(Capsule())

                        HStack {
                            Text(timeString)
                                .font(.custom("PTSans-NarrowBold", size: 50))
                                .foregroundStyle(.steelBlue)
                        }
                        .frame(width: 200, height: 70)
                        //.background(.accent)
                        .cornerRadius(10)
                        .sensoryFeedback(
                            .impact(weight: .heavy),
                            trigger: stopwatch.isRunning
                        )

                        Button {
                            withAnimation(.smooth(duration: 0.2)) {
                                if stopwatch.isRunning {
                                    stopwatch.pause()
                                } else {
                                    stopwatch.start()
                                }
                            }
                        } label: {
                            Image(
                                systemName: !stopwatch.isRunning
                                    ? "play.fill" : "xmark"
                            )
                            .font(.system(size: 30))
                            .foregroundStyle(
                                !stopwatch.isRunning
                                    ? Color.green : .red.opacity(0.8)
                            )
                        }
                        .frame(width: 60, height: 60)
                        .background(
                            !stopwatch.isRunning
                                ? Color.green.opacity(0.3) : .red.opacity(0.2)
                        )
                        .clipShape(Capsule())
                        .sensoryFeedback(
                            .impact(weight: .heavy),
                            trigger: stopwatch.isRunning
                        )

                    }
                    .frame(width: 349, height: 80)
                    .background(.darkBlue)
                    .cornerRadius(12)
                    .offset(y: 70)

                }
                
                Spacer()
                ScrollView {
                    CalendarView()
                        .frame(width: 430)
                        .environmentObject(dateHolder)
                        .padding(.top, 8)
                    WorkoutDayView(
                        addNewSet: addNewSet,
                        addNewMuscleGroup: addNewMuscleGroup,
                        workoutData: $data
                    )
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                }
                .frame(width: 450, height: 720)
                //.background(.primaryBlue)
                .cornerRadius(10)
                HStack {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "home"
                            xOffset = -116
                        }
                    }) {
                        if tab == "home" {
                            Image(systemName: "house")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "house")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "add"
                            xOffset = -58
                        }
                    }) {
                        if tab == "add" {
                            Image(systemName: "plus")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "plus")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "chart"
                            xOffset = 0
                        }
                    }) {
                        if tab == "chart" {
                            Image(systemName: "chart.xyaxis.line")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "chart.xyaxis.line")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "search"
                            xOffset = 59
                        }
                    }) {
                        if tab == "search" {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "settings"
                            xOffset = 116
                        }
                    }) {
                        if tab == "settings" {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                }
                .frame(width: 300, height: 60)
                .background(.darkBlue)
                .cornerRadius(30)
                .shadow(
                    color: .white.opacity(0.9), 
                    radius: 4,
                    x: 0,
                    y: 0
                )

                Rectangle()
                    .fill(.pinkAccent.opacity(0.3))
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .offset(x: CGFloat(xOffset), y: -58)

            }
            if showAddSetModal {
                AddSetModalView(newSetWeight: $newSetWeight, showAddSetModal: $showAddSetModal)
            } else if showAddWorkoutDayMuscleGroup {
                VStack {
                    VStack {
                        HStack(alignment: .top) {
                            Rectangle()
                                .fill(
                                    Color(
                                        MuscleGroupColorMap[newMuscleGroup]
                                            ?? .gray
                                    )
                                )
                                .frame(width: 20)
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(newMuscleGroup)
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 35
                                                    )
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 20)
                                                .onTapGesture {
                                                    showMuscleGroupDropdown = true;
                                                }
                                                .background(.darkBlue)
                                                .cornerRadius(5)
                                            Spacer()
                                        }
                                    
                                    }
                                    .frame(width: 220)
                                    .padding(5)
                                    .overlay(
                                        showMuscleGroupDropdown ?
                                            ScrollView {
                                                VStack {
                                                    ForEach(
                                                        MuscleGroupColorMap.sorted(by: {
                                                            $0.key < $1.key
                                                        }),
                                                        id: \.key
                                                    ) {
                                                        muscleGroup in
                                                        if muscleGroup.key != "Muscle Group" {
                                                            HStack {
                                                                Rectangle()
                                                                    .fill(
                                                                        Color(
                                                                            muscleGroup.value
                                                                        )
                                                                    )
                                                                    .frame(width: 10)
                                                                Text(muscleGroup.key)
                                                                    .font(
                                                                        .custom(
                                                                            "PTSans-Narrow",
                                                                            size: 25
                                                                        )
                                                                    )
                                                                    .padding(.leading, 5)
                                                                    .padding(.trailing, 5)
                                                                    .padding(.top, -5)
                                                                    .foregroundStyle(.darkBlue)
                                                                Spacer()
                                                            }
                                                            .frame(height: 40)
                                                            .onTapGesture {
                                                                showMuscleGroupDropdown = false;
                                                                newMuscleGroup = muscleGroup.key
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            .frame(width: 200, height: 200)
                                            .background(.white)
                                            .clipShape(
                                                UnevenRoundedRectangle(
                                                    topLeadingRadius: 0,
                                                    bottomLeadingRadius: 10,
                                                    bottomTrailingRadius: 10,
                                                    topTrailingRadius: 0
                                                )
                                            )
                                            .offset(x: -10, y: 125)
                                        :
                                        nil
                                        
                                    )
                                    Spacer()
                                    Button {
                                        newExcercises.insert(
                                            ExcerciseWorkout(
                                                 id: "",
                                                 name: newExcerciseName,
                                                 location: "",
                                                 muscleGroup: newMuscleGroup,
                                                 sets: [],
                                                 isAddedIn: false
                                            ),
                                            at: 0
                                        )
                                    } label: {
                                        Text("Add")
                                            .font(
                                                .custom(
                                                    "PTSans-NarrowBold",
                                                    size: 25
                                                )
                                            )
                                            .foregroundStyle(.steelBlue)
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                ScrollView {
                                    ForEach($newExcercises, id: \.self) {
                                        $excercise in
                                        VStack {
                                            if excercise.isAddedIn {
                                                HStack {
                                                    Text(excercise.name)
                                                        .font(
                                                            .custom(
                                                                "Inder-Regular",
                                                                size: 18
                                                            )
                                                        )
                                                        .foregroundStyle(
                                                            .darkBlue
                                                        )
                                                        .padding(.leading, 10)
                                                        .padding(.top, 10)
                                                    Spacer()
                                                    Button {
                                                        if let index = newExcercises.firstIndex(of: excercise) {
                                                            newExcercises.remove(at: index)
                                                        }
                                                    } label: {
                                                        Image(
                                                            systemName:
                                                                "trash"
                                                        )
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(.red.opacity(0.5))
                                                        .padding(.top, 10)
                                                        .padding(.trailing, 5)
                                                    }
                                                }
                                            } else {
                                                HStack {
                                                    VStack {
                                                        TextField(
                                                            "",
                                                            text:
                                                                $newExcerciseName
                                                        )
                                                        .font(
                                                            .custom(
                                                                "Inder-Regular",
                                                                size: 18
                                                            )
                                                        )
                                                        .frame(width: 300)
                                                        .padding(.leading, 10)
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
                                            }
                                            if excercise.isAddedIn {
                                                Spacer()
                                            } else {
                                                HStack {
                                                    Spacer()
                                                    HStack(spacing: 30) {
                                                        Button {
                                                            newExcercises
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
                                                            excercise.isAddedIn =
                                                                true
                                                            excercise.name =
                                                                newExcerciseName
                                                            newExcerciseName =
                                                                ""
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
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            }
                            Spacer()

                        }
                        .frame(width: 380, height: 400)
                        .background(.offWhite)
                        .clipShape(
                            UnevenRoundedRectangle(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 10,
                                topTrailingRadius: 10
                            )
                        )

                        HStack {
                            Button {
                                showAddWorkoutDayMuscleGroup = false
                            } label: {
                                Text("Delete")
                                    .foregroundStyle(
                                        Color(
                                            red: 195 / 255,
                                            green: 27 / 255,
                                            blue: 4 / 255
                                        )
                                    )
                                    .font(.custom("Inder-Regular", size: 23))
                            }
                            .frame(width: 150)
                            .padding(.trailing, 20)
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(width: 1, height: 70)
                                .padding(.top, 10)
                            Button {
                                showAddWorkoutDayMuscleGroup = false
                                data.insert(
                                    MuscleGroupWorkout(id: "mm4", muscleGroup: newMuscleGroup, excercises: newExcercises, date: Date()), at: 0)
                                newMuscleGroup = "Muscle Group"
                                newExcercises = []
                            } label: {
                                Text("Save")
                                    .font(.custom("Inder-Regular", size: 23))
                                    .foregroundStyle(newMuscleGroup == "Muscle Group" ? .gray : .primaryBlue)
                            }
                            .frame(width: 150)
                            .padding(.leading, 10)
                            .disabled(newMuscleGroup == "Muscle Group")
                        }
                        .frame(width: 300, height: 60)
                    }
                    .frame(width: 400, height: 500)
                    .background(.white)
                    .cornerRadius(20)
                    .offset(x: 0, y: 50)
                    .shadow(
                        color: .white.opacity(0.9),
                        radius: 4,
                        x: 0,
                        y: 0
                    )
                }
                .frame(width: 600, height: 1000)
                .background(.black.opacity(0.7))
            }

            VStack {
                AddItem()
            }
            .frame(height: 1000)
            .offset(x: 0, y: tab == "add" ? 110 : 2000)
            .opacity(tab == "add" ? 1 : 0.2)

        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: 400, height: 1000)
    }
}

#Preview {
    HomeView()
}
