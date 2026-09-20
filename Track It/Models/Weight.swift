//
//  Weight.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import Foundation
import FirebaseFirestore

struct Weight: Codable, Identifiable {
    var weight: String
    var date: String
    var id: String
}
