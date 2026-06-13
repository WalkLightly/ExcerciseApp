//
//  ExcercisesAPI.swift
//  Track It
//
//  Created by Michael Knight on 6/13/26.
//
import Foundation
import FirebaseFirestore


class ExcercisesAPI {
    static let shared = ExcercisesAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
    func getAllExcercises () async throws -> [Excercise] {
        var excercises: [Excercise] = []
        
        do {
          let querySnapshot = try await db.collection("exercises").getDocuments()
//          for document in querySnapshot.documents {
//              let bookData = document.data()
//              let author = bookData["author"] as? [String] ?? [""]
//              let book = Book(id: document.documentID,
//                              name: bookData["name"] as? String ?? "",
//                              series: bookData["series"] as? String ?? "",
//                              orderInSeries: bookData["orderInSeries"] as? String ?? "",
//                              author: author[0],
//                              genres: bookData["genres"] as? [String] ?? [""],
//                              format: bookData["format"] as? String ?? "",
//                              ageRange: bookData["ageRange"] as? String ?? "",
//                              language: bookData["language"] as? String ?? "")
//              books.append(book)
           // print("\(book)")
            for document in querySnapshot.documents {
                let excerciseData = document.data()
                let excercise = Excercise(id: document.documentID,
                                          name: excerciseData["name"] as? String ?? "",
                                          location: excerciseData["location"] as? String ?? "",
                                          muscleGroup: excerciseData["muscleGroup"] as? String ?? "")
                
                excercises.append(excercise)
            }
            print(excercises)
          //}
        } catch {
          print("Error getting excercises: \(error)")
        }
        
        return excercises
    }
    
}
