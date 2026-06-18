//
//  CalendarHelper.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//

import Foundation

class CalendarHelper
{
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    func monthYearString(_ date: Date) -> String
    {
        dateFormatter.dateFormat = "LLL yyyy"
        return dateFormatter.string(from: date)
    }
    
    func plusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func monthInt(_ date: Date) -> Int {
        return calendar.component(.month, from: date);
    }
    
    func minusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func daysInMonth(_ date: Date) -> Int
    {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func dayOfMonth(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(_ date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDay(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
    func formattedDate() -> String {
        let day = Calendar.current.dateComponents([.day], from: Date())
        let month = Calendar.current.dateComponents([.month], from: Date())
        let year = Calendar.current.dateComponents([.year], from: Date())

        var monthString = String(month.month ?? -1)
        if monthString.count == 1 {
            monthString = "0\(monthString)"
        }
        
        let dayString = String(day.day ?? -1)
        let yearString = String(year.year ?? -1)
        
        return monthString + "/" + dayString + "/" + yearString
    }
    
}
