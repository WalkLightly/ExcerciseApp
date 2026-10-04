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

    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            .frame(width: 500, height: 1500)
            VStack(alignment: .leading) {
                TextField("Search . . .", text: $searchText)
                    .frame(width: 250, height: 40)
                    .foregroundStyle(.black)
                    .font(.custom("Inder-Regular", size: 20))
                    .padding(.leading, 5)
                    .padding(.top, -15)
                    .focused($showTypeAhead)
                
                Rectangle()
                    .fill(.darkBlue)
                    .frame(width: 250, height: 2)
                    .opacity(0.7)
                    .offset(y: -10)
            }
//            if showGenresAvailable {
//                ScrollView {
//                    ForEach(genresAvailable, id: \.self) { availableGenre in
//                        if genre == "" || availableGenre.contains(genre) {
//                            Text(availableGenre)
//                                .font(.custom("Inder-Regular", size: 20))
//                                .foregroundStyle(.black)
//                                .frame(width: 250, alignment: .leading)
//                                .padding(.leading, 20)
//                                .padding(.top, 5)
//                                .onTapGesture {
//                                    genres.append(availableGenre)
//                                    genre = ""
//                                    showGenresAvailable = false
//                                }
//                        }
//                    }
//                }
//                .frame(width: 250, height: 200)
//                .background(.white)
//                .cornerRadius(10)
//                .offset(x: -46, y: 35)
//                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 1, y: 4)
//            }
        }
        .onAppear {
            showTypeAhead = true
        }
    }
}

#Preview {
    SearchView()
}
