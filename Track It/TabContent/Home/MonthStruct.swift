//
//  MonthStruct.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//


import Foundation
import SwiftUI


struct MonthStruct
{
    var monthType: MonthType
    var dayInt : Int
    func day() -> String
    {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
}