//
//  CalendarCell.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int

    var body: some View {
        VStack {
            if monthStruct().monthType == MonthType.Current {
                Text(monthStruct().day())
                    .font(.custom("Poppins-Regular", size: 15))
                HStack(spacing: -10) {
                    // loop over the excercises for this day
                    if monthStruct().dayInt == 4 {
                        Rectangle()
                            .fill(.shouldersAccent)
                            .frame(width: 20, height: 20)
                            .clipShape(Capsule())
                        Rectangle()
                            .fill(.legsAccent)
                            .frame(width: 20, height: 20)
                            .clipShape(Capsule())
                    } else if monthStruct().dayInt == 5 {
                        Rectangle()
                            .fill(.chestAccent)
                            .frame(width: 20, height: 20)
                            .clipShape(Capsule())
                    }
                    else if monthStruct().dayInt == 6 {
                       Rectangle()
                           .fill(.backAccent)
                           .frame(width: 20, height: 20)
                           .clipShape(Capsule())
                       Rectangle()
                           .fill(.bicepsAccent)
                           .frame(width: 20, height: 20)
                           .clipShape(Capsule())
                       Rectangle()
                           .fill(.cardioAccent)
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
            monthStruct().monthType == MonthType.Current
                ? .darkBlue : .grayBlue.opacity(0.1)
        )
        .cornerRadius(10)
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
            daysInPrevMonth: 1
        )
        .environmentObject(dateHolder)
    }
}
