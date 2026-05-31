//
//  CalendarView.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import SwiftUI

struct CalendarView: View {
    let gridData: [[Int]] = (0...7).map { row in
        (1...7).map { col in (row * 6) + col }
    }

    @EnvironmentObject var dateHolder: DateHolder

    var body: some View {

        VStack(spacing: 1) {
            DateScrollerView()
                .environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
                .padding(.bottom, 10)
            calendarGrid

        }
    }

    var dayOfWeekStack: some View {
        HStack(spacing: -53) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
        .padding(.bottom, 30)
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

                    }
                }
            }
        }
    }
}

#Preview {
    let dateHolder = DateHolder()
    CalendarView()
        .environmentObject(dateHolder)
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: 375)
            .padding(.top, 1)
            .font(.custom("Inder-Regular", size: 20))
    }
}
