//
//  HomeView.swift
//  Track It
//
//  Created by Michael Knight on 5/27/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tab: String = "home"
    @State private var xOffset = -116

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
                                .font(.custom("PTSans-NarrowBold", size: 40))
                                // .font(.system(size: 30))

                                .foregroundStyle(.steelBlue)
                        }
                        .frame(width: 200, height: 70)
                        //.background(.accent)
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
                    .background(.darkBlue)
                    .cornerRadius(12)
                    .offset(y: 60)

                }
                Spacer()

                HStack {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4)) {
                            tab = "home"
                            xOffset = -116
                        }
                    }) {
                        if tab == "home" {
                            Image(systemName: "house")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "house")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4)) {
                            tab = "add"
                            xOffset = -58
                        }
                    }) {
                        if tab == "add" {
                            Image(systemName: "plus")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "plus")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4)) {
                            tab = "chart"
                            xOffset = 0
                        }
                    }) {
                        if tab == "chart" {
                            Image(systemName: "chart.xyaxis.line")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "chart.xyaxis.line")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4)) {
                            tab = "search"
                            xOffset = 59
                        }
                    }) {
                        if tab == "search" {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4)) {
                            tab = "settings"
                            xOffset = 116
                        }
                    }) {
                        if tab == "settings" {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundStyle(.pinkAccent)
                        } else {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                }
                .frame(width: 300, height: 60)
                .background(.primaryBlue)
                .cornerRadius(30)
                
                Rectangle()
                .fill(.pinkAccent.opacity(0.3))
                .frame(width: 50, height: 40)
                .cornerRadius(50)
                .offset(x: CGFloat(xOffset), y: -58)
//                if (tab == "home") {
//                    Rectangle()
//                        .fill(.pinkAccent.opacity(0.3))
//                        .frame(width: 50, height: 40)
//                        .cornerRadius(50)
//                        .offset(x: -116, y: -58)
//                } else if (tab == "add") {
//                    Rectangle()
//                        .fill(.pinkAccent.opacity(0.3))
//                        .frame(width: 50, height: 40)
//                        .cornerRadius(50)
//                        .offset(x: -58, y: -58)
//                } else if (tab == "chart") {
//                    Rectangle()
//                        .fill(.pinkAccent.opacity(0.3))
//                        .frame(width: 50, height: 40)
//                        .cornerRadius(50)
//                        .offset(x: 0, y: -58)
//                } else if (tab == "search") {
//                    Rectangle()
//                        .fill(.pinkAccent.opacity(0.3))
//                        .frame(width: 50, height: 40)
//                        .cornerRadius(50)
//                        .offset(x: 59, y: -58)
//                } else {
//                    Rectangle()
//                        .fill(.pinkAccent.opacity(0.3))
//                        .frame(width: 50, height: 40)
//                        .cornerRadius(50)
//                        .offset(x: 116, y: -58)
//                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
