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
    @State private var stopWatchActive: Bool = false
    @StateObject private var stopwatch = Stopwatch()

    var timeString: String {
        let minutes = Int(stopwatch.counter) / 60
        let seconds = Int(stopwatch.counter) % 60
        let milliseconds = Int(
            (stopwatch.counter.truncatingRemainder(dividingBy: 1)) * 100
        )

        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }

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
                            stopwatch.reset()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .font(.system(size: 30))
                                .foregroundStyle(.accentGrey)
                        }
                        .frame(width: 60, height: 60)
                        .background(.accentGrey.opacity(0.5))
                        .clipShape(Capsule())

                        HStack {
                            Text(timeString)
                                .font(.custom("PTSans-NarrowBold", size: 50))
                                .foregroundStyle(.steelBlue)
                        }
                        .frame(width: 200, height: 70)
                        //.background(.accent)
                        .cornerRadius(10)
                        .sensoryFeedback(.impact(weight: .heavy), trigger: stopwatch.isRunning)

                        Button {
                            withAnimation(.smooth(duration: 0.2)) {
                                if stopwatch.isRunning {
                                    stopwatch.pause()
                                } else {
                                    stopwatch.start()
                                }
                            }
                        } label: {
                            Image(
                                systemName: !stopwatch.isRunning
                                    ? "play.fill" : "xmark"
                            )
                            .font(.system(size: 30))
                            .foregroundStyle(
                                !stopwatch.isRunning
                                    ? Color.green : .red.opacity(0.8)
                            )
                        }
                        .frame(width: 60, height: 60)
                        .background(
                            !stopwatch.isRunning
                                ? Color.green.opacity(0.3) : .red.opacity(0.2)
                        )
                        .clipShape(Capsule())
                        .sensoryFeedback(.impact(weight: .heavy), trigger: stopwatch.isRunning)

                    }
                    .frame(width: 349, height: 80)
                    .background(.darkBlue)
                    .cornerRadius(12)
                    .offset(y: 60)

                }
                Spacer()
                VStack {
                    let dateHolder = DateHolder()
                    CalendarView()
                        .environmentObject(dateHolder)
                    Spacer()
                }
                .frame(width: 400, height: 640)
                .background(.primaryBlue)
                .cornerRadius(10)
                HStack {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
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
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
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
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
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
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
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
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
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
         
            }
            VStack {
                AddItem()
            }
            .offset(x: 0, y: tab == "add" ? 90 : 2000)
            .opacity(tab == "add" ? 1 : 0.2)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
