//
//  Track_ItApp.swift
//  Track It
//
//  Created by Michael Knight on 5/27/26.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Track_ItApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView(newMuscleGroupWorkout: MockMuscleGroupWorkout().mockDataList[0])
                .preferredColorScheme(.dark)
        }
    }
}
