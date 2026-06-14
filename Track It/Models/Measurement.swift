//
//  Measurement.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//

import Foundation
import FirebaseFirestore

//let sampleBook = Book(id: "1", name: "book name", series: "The Heroes of Olympus", orderInSeries: "2", author: "some format here", genres: ["fantaqsy"], format: "some language here", ageRange: "HArry potter", language: "English")
//
//struct MockData {
//    let booksList: [Book] = [sampleBook, sampleBook2]
//}

struct Measurement {
    var id: String
    var bodyPart: String
    var measurement: String
    var dateRecorded: String
}
