//
//  CalendarView.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import SwiftUI

struct CalendarView: View {
    let changeDate: (String) -> Void

    let gridData: [[Int]] = (0...7).map { row in
        (1...7).map { col in (row * 6) + col }
    }

    @EnvironmentObject var dateHolder: DateHolder

    var body: some View {

        VStack {
            // shoulders/legs triceps/chest biceps/back abs cardio
            // clicking one of thes up top, show which days of the month I did each one for
            //            VStack(alignment: .leading) {
            //                HStack {
            //                    VStack(spacing: -1) {
            //                        Text("Shoulders")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //                    }
            //                    .frame(height: 30)
            //                    .background(.shouldersAccent)
            //                    .cornerRadius(20)
            //
            //                    VStack(spacing: -1) {
            //                        Text("Legs")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.legsAccent)
            //                    .cornerRadius(20)
            //
            //                    VStack(spacing: -1) {
            //                        Text("Triceps")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.tricepsAccent)
            //                    .cornerRadius(20)
            //
            //                    VStack(spacing: -1) {
            //                        Text("Chest")
            //                            .padding(15)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.chestAccent)
            //                    .cornerRadius(20)
            //                }
            //                HStack {
            //                    VStack(spacing: -1) {
            //                        Text("Back")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //                    }
            //                    .frame(height:  30)
            //                    .background(.backAccent)
            //                    .cornerRadius(20)
            //                    VStack(spacing: -1) {
            //                        Text("Biceps")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.bicepsAccent)
            //                    .cornerRadius(20)
            //
            //                    VStack(spacing: -1) {
            //                        Text("Cardio")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.cardioAccent)
            //                    .cornerRadius(20)
            //
            //                    VStack(spacing: -1) {
            //                        Text("Abs")
            //                            .padding(10)
            //                            .foregroundStyle(.black)
            //
            //                    }
            //                    .frame(height:  30)
            //                    .background(.absAccent)
            //                    .cornerRadius(20)
            //                }
            //            }
            //            .padding(.leading, -50)
            DateScrollerView()
                .environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
                .padding(.bottom, 10)
            calendarGrid
                .padding(.bottom, 15)

        }
        .frame(width: 400)
        .background(.cornflowerBlue)
        .cornerRadius(10)
        .shadow(
            color: .white.opacity(0.9),  // Soft, subtle shadow color
            radius: 4,  // Blur radius
            x: 0,  // Horizontal offset
            y: 0  // Vertical offset (pushes shadow down)
        )
        //        .padding(10)
    }

    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
        .frame(width: 380)
        .padding(.bottom, 10)
        .background(.backgroundBlue)
        .cornerRadius(10)
    }

    var calendarGrid: some View {
        VStack(spacing: 1) {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)

            ForEach(0..<6) {
                row in
                HStack(spacing: 1) {
                    ForEach(1..<8) {
                        column in
                        let count = column + (row * 7)
                        CalendarCell(
                            count: count,
                            startingSpaces: startingSpaces,
                            daysInMonth: daysInMonth,
                            daysInPrevMonth: daysInPrevMonth
                        )
                        .environmentObject(dateHolder)
                        .onTapGesture {
                            let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
                            var dayInt = -1
                            if count <= start {
                                let day = daysInPrevMonth + count - start
                                dayInt = MonthStruct(monthType: MonthType.Previous, dayInt: day).dayInt
                            } else if count - start > daysInMonth {
                                let day = count - start - daysInMonth
                                dayInt = MonthStruct(monthType: MonthType.Next, dayInt: day).dayInt
                            }
                            
                            if (dayInt == -1) {
                                let day = count - start
                                dayInt = MonthStruct(monthType: MonthType.Current, dayInt: day).dayInt
                            }
                            
                            let monthYearStr = CalendarHelper().monthYearString(dateHolder.date)
                            var monthStr = String(CalendarHelper().monthInt(dateHolder.date))
                            
                            if monthStr.count == 1 {
                                monthStr = "0\(monthStr)"
                            }
                            
                            let dateString = "\(monthStr)/\(dayInt)/\(monthYearStr.split(separator: " ")[1])"
                            changeDate(dateString)
                        }

                    }
                }
            }
        }
        .transition(
            .move(edge: .leading).combined(with: .opacity)
        )
    }
}

#Preview {
    let dateHolder = DateHolder()
    CalendarView(changeDate: { _ in })
        .environmentObject(dateHolder)
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: 375)
            .padding(.top, 1)
            .font(.custom("Inder-Regular", size: 20))
            .foregroundStyle(.grayBlue)
    }
}
