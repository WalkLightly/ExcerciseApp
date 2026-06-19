//
//  CalendarCell.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import SwiftUI

struct CalendarCell: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int
    let workoutData: [MuscleGroupWorkout]
    
    func getDayBackground() -> Color {
        
        let calendar = Calendar.current
        let today = Date()

        // 2. Extract the specific components you need
        let month = calendar.component(.month, from: today)
        let day = calendar.component(.day, from: today)
        let year = calendar.component(.year, from: today)
        
        if (day == monthStruct().dayInt && month == CalendarHelper().monthInt(dateHolder.date)
        && monthStruct().monthType == MonthType.Current && year == Calendar.current.component(.year, from: dateHolder.date)) {
            return .teal
        } else if monthStruct().monthType == MonthType.Current {
            return .darkBlue
        } else {
            return .grayBlue.opacity(0.1)
        }
    }
    
    func getDayText() -> Color {
        let calendar = Calendar.current
        let today = Date()

        // 2. Extract the specific components you need
        let month = calendar.component(.month, from: today)
        let day = calendar.component(.day, from: today)
        let year = calendar.component(.year, from: today)
        
        if (day == monthStruct().dayInt && month == CalendarHelper().monthInt(dateHolder.date)
        && monthStruct().monthType == MonthType.Current && year == Calendar.current.component(.year, from: dateHolder.date)) {
            return .darkBlue
        } else {
            return .white
        }
    }
    
    func getCurrentDate() -> String {
        var day = -1
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if count <= start {
            let tDay = daysInPrevMonth + count - start
            day = MonthStruct(monthType: MonthType.Previous, dayInt: tDay).dayInt
        } else if count - start > daysInMonth {
            let tDay = count - start - daysInMonth
            day = MonthStruct(monthType: MonthType.Next, dayInt: tDay).dayInt
        }

        if day == -1 {
            
        let tDay = count - start
            day = MonthStruct(monthType: MonthType.Current, dayInt: tDay).dayInt
        }
        
        let monthYearStr = CalendarHelper().monthYearString(dateHolder.date)
        var monthStr = String(CalendarHelper().monthInt(dateHolder.date))
        
        if monthStr.count == 1 {
            monthStr = "0\(monthStr)"
        }
        
        var dateString = monthStr + "/"
        dateString += String(day) + "/"
        dateString += monthYearStr.split(separator: " ")[1]
        
        return dateString
    }
    
    func getExercisesForToday() -> [MuscleGroupWorkout] {
        return workoutData.filter({$0.date == getCurrentDate()})
    }
    
    var body: some View {
        VStack {
            if monthStruct().monthType == MonthType.Current {
                Text(monthStruct().day())
                //Text(getCurrentDate())
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(getDayText())
                HStack(spacing: -10) {
                    // loop over the excercises for this day
                    ForEach(getExercisesForToday()) { data in
                        Rectangle()
                            .fill(MuscleGroupColorMap[data.muscleGroup] ?? .darkBlue)
                            .frame(width: 20, height: 20)
                            .clipShape(Capsule())
                    }
                }
                .padding(.top, -10)
                .frame(height: 15)

            } else {
                Text("")
            }
        }
        .foregroundColor(.white)
        .frame(width: 53, height: 53)
        .background(
           getDayBackground()
        )
        .cornerRadius(10)
        .onAppear {
            
           
//            Task {
//                try await viewModel.getWorkoutsForDate(date: dateString)
//            }
        }
    }

    func monthStruct() -> MonthStruct {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if count <= start {
            let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        } else if count - start > daysInMonth {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }

        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        let dateHolder = DateHolder()
        CalendarCell(
            count: 1,
            startingSpaces: 1,
            daysInMonth: 1,
            daysInPrevMonth: 1,
            workoutData: MockMuscleGroupWorkout().mockDataList
        )
        .environmentObject(dateHolder)
    }
}
