//
//  DateHolder.swift
//  Track It
//
//  Created by Michael Knight on 5/31/26.
//


import Foundation
internal import Combine

class DateHolder: ObservableObject
{
    @Published var date = Date() //todays date
}
