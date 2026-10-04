//
//  SearchView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct SearchView: View {
    @FocusState var showTypeAhead: Bool
    @State var searchText: String = ""
    @State var chosenResult: String = ""
    @StateObject private var viewModel = ExerciseCardViewModel()
    @State private var exercises: [Excercise] = []
    @State private var typeAheadResults: [String] = ["Shoulders",
                                                      "Legs",
                                                      "Triceps",
                                                      "Chest",
                                                      "Back",
                                                      "Biceps",
                                                      "Cardio",
                                                      "Abs",
                                                      "Forearms"]
    
    func fetchData() async throws -> Void {
        exercises = try await viewModel.getAllExercises()
        
        for ex in exercises {
            typeAheadResults.append(ex.name)
        }
    }

    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            .frame(width: 500, height: 1500)
            VStack(alignment: .leading) {
                VStack {
                    TextField("Search . . .", text: $searchText)
                        .frame(width: 380, height: 40)
                        .foregroundStyle(.grayBlue)
                        .font(.custom("Inder-Regular", size: 30))
                        .padding(.leading, 5)
                        .padding(.top, -15)
                        .focused($showTypeAhead)
                    
                    Rectangle()
                        .fill(.cornflowerBlue)
                        .frame(width: 380, height: 4)
                        .opacity(0.7)
                        .offset(y: -5)
                }
                .padding(.top, -40)
                VStack {
                    
                }.frame(width: 390, height: 600)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    .shadow(
                        color: Color.black.opacity(0.6),
                        radius: 4,
                        x: 1,
                        y: 3
                    )
            }
            if showTypeAhead {
                ScrollView {
                    ForEach(typeAheadResults, id: \.self) { result in
                        if searchText == "" || result.contains(searchText) {
                            Text(result)
                                .font(.custom("Inder-Regular", size: 20))
                                .foregroundStyle(.black)
                                .frame(width: 250, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, 5)
                                .onTapGesture {
                                    chosenResult = result
                                    showTypeAhead = false
                                }
                        }
                    }
                }
                .frame(width: 250, height: 200)
                .background(.white)
                .cornerRadius(10)
                .offset(x: -64, y: -225)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 1, y: 4)
            }
        }
        .onAppear {
            showTypeAhead = false
            
            Task {
                try await fetchData()
            }
        }
        .onTapGesture {
            showTypeAhead = false
        }
    }
}

#Preview {
    SearchView()
}
