//
//  HomeView.swift
//  Track It
//
//  Created by Michael Knight on 5/27/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.backgroundBlue)
            VStack {
                ZStack {
                    VStack {
                        
                    }
                    .frame(width: 345, height: 30)
                    .background(.skyBlue)
                    .cornerRadius(18)
                    .offset(y: 90)
                    HStack {
//                        Button {
//                        } label: {
//                            Image(systemName: "arrow.trianglehead.clockwise")
//                                .font(.system(size: 30))
//                                .foregroundStyle(.gray)
//                        }.frame(width: 60, height: 60)
//                            .background(.accentGrey.opacity(0.8))
//                            .clipShape(Capsule())
                        Button {
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 30))
                                .foregroundStyle(.red.opacity(0.8))
                        }.frame(width: 60, height: 60)
                            .background(.red.opacity(0.2))
                            .clipShape(Capsule())
                        HStack {
                            Text("0 1 : 0 2 . 0 5")
                                .font(.custom("Inder-Regular", size: 25))
                        }
                        .frame(width: 200, height: 70)
                        .background(.gray)
                        .cornerRadius(10)
                        Button {
                        } label: {
                            Image(systemName: "play.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.green)
                        }
                        .frame(width: 60, height: 60)
                        .background(Color.green.opacity(0.3))
                        .clipShape(Capsule())
                    }
                    .frame(width: 349, height: 80)
                    .background(.gray)
                    .cornerRadius(12)
                    .offset(y: 60)

                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
