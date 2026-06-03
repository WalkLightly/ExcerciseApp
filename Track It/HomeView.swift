//
//  HomeView.swift
//  Track It
//
//  Created by Michael Knight on 5/27/26.
//

import SwiftUI

struct HomeView: View {
    @State private var dateHolder = DateHolder()

    @State private var tab: String = "home"
    @State private var xOffset = -116
    @State private var stopWatchActive: Bool = false
    @State private var newSetWeight: String = ""

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
                        .sensoryFeedback(
                            .impact(weight: .heavy),
                            trigger: stopwatch.isRunning
                        )

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
                        .sensoryFeedback(
                            .impact(weight: .heavy),
                            trigger: stopwatch.isRunning
                        )

                    }
                    .frame(width: 349, height: 80)
                    .background(.darkBlue)
                    .cornerRadius(12)
                    .offset(y: 60)

                }
                Spacer()
                ScrollView {
                    CalendarView()
                        .frame(width: 430)
                        .environmentObject(dateHolder)
                        .padding(.top, 8)
                    WorkoutDayView()
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                }
                .frame(width: 450, height: 720)
                //.background(.primaryBlue)
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
                HStack {
                    VStack {
                        TextField("", text: $newSetWeight)
                            .frame(width: 200, height: 55)
                            .foregroundStyle(.darkBlue)
                            .font(.custom("Inder-Regular", size: 40))
                            .padding(.leading, 5)
                            .padding(.top, -15)
                            .multilineTextAlignment(.trailing)
                        Rectangle()
                            .fill(.darkBlue)
                            .frame(width: 200, height: 2)
                            .offset(y: -8)
                    }
                    .padding(.top, 50)
                    Text("lbs")
                        .font(.custom("Inder-Regular", size: 35))
                        .padding(.top, 40)


                }
                //                Text("Are you sure you want to delete this item?")
                //                    .font(.custom("Inder-Regular", size: 20))
                //                    .foregroundColor(Color.black)
                //                    .padding(.top, 20)
                //                    .frame(width: 300, height: 110)
                .frame(width: 300, height: 110)
                .background(
                    Rectangle()
                        .fill(Color.black.opacity(0.3))  // Set the border color
                        .frame(height: 1),  // Set the border thickness (height)
                    alignment: .bottom  // Align the rectangle to the bottom
                )
                HStack {
                    Button {
                        //showConfirmDeleteDialog = false
                    } label: {
                        Text("Cancel")
                            .font(.custom("Inder-Regular", size: 23))
                            .foregroundStyle(.skyBlue)
                    }
                    .frame(width: 130)
                    Rectangle()
                        .fill(Color.black.opacity(0.3))  // Set the border color
                        .frame(width: 1, height: 55)
                    Button {
                        // showConfirmDeleteDialog = false
                    } label: {
                        Text("Delete")
                            .foregroundStyle(Color(red: 195/255, green: 27/255, blue: 4/255))
                            .font(.custom("Inder-Regular", size: 23))
                    }
                    .frame(width: 130)
                }
                .frame(width: 300, height: 40)
                .padding(.bottom, 20)
            }
            .frame(width: 300, height: 150)
            .background(.brown)
            .cornerRadius(20)
            .offset(x: 0, y: 50)
            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 1, y: 2)
            
            VStack {
                AddItem()
            }
            .offset(x: 0, y: tab == "add" ? 110 : 2000)
            .opacity(tab == "add" ? 1 : 0.2)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: .infinity, height: 1000)
    }
}

#Preview {
    HomeView()
}
