//
//  SettingsView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct SettingsView: View {
    
    var MuscleGroups: [String] = [
        "Shoulders",
        "Legs",
        "Triceps",
        "Chest",
        "Back",
        "Biceps",
        "Cardio",
        "Abs",
        "Forearms"
    ]
    
    @StateObject private var viewModel = ExerciseCardViewModel()
    @StateObject private var homeViewModel = HomeViewModel()

    @State private var exercises: [Excercise] = []
    @State private var showEditModal: Bool = false
    @State private var chosenExName: String = ""
    @State private var chosenExWeight: String = ""

    @State private var csvFileURL: URL?
    @State private var Workouts: [MuscleGroupWorkout] = []

    
    let headers = ["ID", "JSON"]
    
    func formatCSV() -> String {
               
        var csvString = ""
                
        // Escape helper for commas, quotes, and newlines
        func sanitize(_ field: String) -> String {
            if field.contains(",") || field.contains("\"") || field.contains("\n") {
                let escaped = field.replacingOccurrences(of: "\"", with: "\"\"")
                return "\"\(escaped)\""
            }
            return field
        }
        
        // Append Header Row
        let headerRow = headers.map { sanitize($0) }.joined(separator: ",")
        csvString.append(headerRow + "\n")
        
        // Append Data Rows
        for wrkout in Workouts {
            do {
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(wrkout)
                let jsonString = String(data: jsonData, encoding: .utf8)
                
                let row = ["\(wrkout.id)", jsonString]
                let rowString = row.map { sanitize($0!) }.joined(separator: ",")
                csvString.append(rowString + "\n")
            } catch {
                print("Failed to convert to JSON: \(error.localizedDescription)")
            }
        }
        
        return csvString
    }
    
    func generateCSV() -> URL? {
        let csvDataString = formatCSV()
                        
        let tempDirectory = FileManager.default.temporaryDirectory
        let fileURL = tempDirectory.appendingPathComponent("musclegroupworkouts.csv")
                
        do {
            try csvDataString.write(to: fileURL, atomically: true, encoding: .utf8)
            return fileURL
        } catch {
            print("Failed to save CSV file: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    func fetchData() async throws -> Void {
        exercises = try await viewModel.getAllExercises()
        Workouts = try await homeViewModel.getAllWorkoutData()
        
    }
    
    func filterExcercises(muscle: String) -> [Excercise] {
        let ex = exercises.filter { $0.muscleGroup == muscle}
        return ex
    }
    
    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            .frame(width: 500, height: 1500)
            VStack {
                HStack(spacing: 150) {
                    Text("Settings")
                        .font(.custom("PTSans-Narrow", size: 55))
                        .padding(.top, 20)
                        .foregroundStyle(.black)
                    if let fileURL = generateCSV() {
                        ShareLink(item: fileURL, preview: SharePreview("Export CSV Data")) {
//                            Button(action: {
//                                withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
//                                {
//                                }
//                            }) {
//                                Image(systemName: "arrow.down.to.line")
//                                    .font(.system(size: 30))
//                                    .foregroundStyle(.black)
//                            }
//                            .frame(width: 80, height: 50)
//                            .background(.chestAccent)
//                            .cornerRadius(10)
//                            .padding(.top, 20)
                            Label("", systemImage: "arrow.down.to.line")
                                .padding(.leading, 10)
                                .foregroundColor(.chestAccent)
                                .cornerRadius(10)
                                .font(Font.system(size: 45))
                        }
                    } else {
                        Text("Error preparing CSV file")
                            .foregroundColor(.red)
                    }
                }
                //.padding(.leading, -200)
                ScrollView {
                    LazyVStack (spacing: 12) {
                        ForEach(MuscleGroups, id: \.self) { muscle in
                            VStack {
                                DisclosureGroup {
                                    ForEach(filterExcercises(muscle: muscle), id: \.self) { excercise in
                                        HStack {
                                            Text(excercise.name)
                                                .font(.custom("Poppins-Regular", size: 20))
                                                .onTapGesture {
                                                    showEditModal = true
                                                    chosenExName = excercise.name
                                                    chosenExWeight = excercise.startingWeight
                                                }
                                                .foregroundStyle(.black)

                                            Spacer()
                                            Text(excercise.startingWeight)
                                                .font(.custom("Poppins-Bold", size: 25))
                                                .foregroundStyle(.black)
                                        }
                                        .padding(.bottom, 2)
                                    }
                                } label: {
                                    HStack {
                                        VStack {
                                            Rectangle()
                                                .fill(MuscleGroupColorMap[muscle] ?? .darkBlue)
                                                .frame(width: 10, height: 10)
                                                .cornerRadius(20)
                                                .padding(.leading, -2)
                                        }
                                        Text("\(muscle)")
                                            .font(.custom("Poppins-Bold", size: 30))
                                            .fontWeight(.bold)
                                            .foregroundStyle(.cornflowerBlue)
                                    }
                                    .frame(height: 60)
                                    
                                }
                                .frame(width: 380)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                            }
                            .frame(width: 400)
                            .background(.white)
                            .cornerRadius(10)
                            .listRowBackground(Color.clear)
                            
                        }
                        .frame(width: 400)
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                }
                .frame(width: 500, height: 700)
            }
            
            if showEditModal {
                EditExcerciseDetailsModalView(name: $chosenExName, startingWeight: $chosenExWeight, showEditModal: $showEditModal, updateDetails: {})
            }

        }
        .task {
            do {
                try await fetchData()
            } catch {
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
