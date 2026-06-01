//
//  DateScrollerView.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//


import SwiftUI

struct DateScrollerView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        HStack
        {
            Spacer()
            Button(action:  {withAnimation(.smooth(duration: 0.3, extraBounce: 0.3))
                {previousMonth() }})
            {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .foregroundStyle(.backgroundBlue)
                    .font(Font.title.weight(.bold))
            }
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.custom("Inder-Regular", size: 30))
                .bold()
                .transition(
                    .move(edge: .leading).combined(with: .opacity)
                )
                .frame(maxWidth: .infinity)
            Button(action:  {withAnimation(.smooth(duration: 0.3, extraBounce: 0.3))
                {nextMonth() }})
            {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .foregroundStyle(.backgroundBlue)
                    .font(Font.title.weight(.bold))
            }
            Spacer()
        }
    }
    
    func previousMonth()
    {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth()
    {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        let dateHolder = DateHolder()

        DateScrollerView()
            .environmentObject(dateHolder)
    }
}
