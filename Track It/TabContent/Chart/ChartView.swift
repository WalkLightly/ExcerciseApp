//
//  ChartView.swift
//  Track It
//
//  Created by Michael Knight on 9/18/26.
//

import SwiftUI
import Charts

struct WeightChartData: Identifiable {
    var id: String
    var date: Date
    var weight: Double
}

struct ChartView: View {
    @StateObject var viewModel = NewItemViewModel()
    @State private var selectedInterval: String = "1M"
    @State private var chartData: String = "weight"
    @State private var weightData: [WeightChartData] = []
    @State private var isLoading = true
    @State private var highestWeight: Double = 0.0
    @State private var lowestWeight: Double = 10000.0
    @State private var chartDataFormat: String = "chart"
    private var chartColor = Color(red: 30/255, green: 30/255, blue: 30/255)
    
    @State private var bodyPart: String = "Body Part"
    @State private var bodyParts: [String] = [
        "Right Arm",
        "Left Arm",
        "Shoulders",
        "Chest",
        "Stomach",
        "Right Forearm",
        "Left Forearm",
        "Left Leg",
        "Right Leg",
        "Left Calf",
        "Right Calf",
        "Glutes"
    ]
    
    func getChartData() -> [Weight] {
        return viewModel.weights
    }
    
    private func fetchChartData() async {
        isLoading = true;
        var weights: [Weight] = []
        
        do {
                // Wrap the throwing API call in a do-catch block
            weights = try await viewModel.getAllWeights()
            for weight in weights {
                let _weight = Double(weight.weight) ?? 0.0
                if _weight > highestWeight {
                    highestWeight = _weight
                }
                
                if _weight < lowestWeight {
                    lowestWeight = _weight
                }
                weightData.append(WeightChartData(id: weight.id, date: formatDate(dateString: weight.date)!, weight: _weight))
            }
            
            weightData.sort { $0.date < $1.date }
            print(weightData)
            } catch {
                print("Failed to fetch weight data: \(error.localizedDescription)")
                // Optional: Update an error state variable here to notify the UI
            }
        isLoading = false;
    }
    
    func formatDate(dateString: String) -> Date? {
        let formatter = DateFormatter()
            formatter.dateFormat = "M/d/yyyy, HH:mm" // Match your exact date string format
            formatter.locale = Locale(identifier: "en_US_POSIX")
        print("date")
        print(formatter.date(from: dateString))
            return formatter.date(from: dateString)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Color(.backgroundBlue)
            }
            //.padding(.bottom, 470)
            .frame(width: 500, height: 1500)
            VStack {
                HStack {
                    HStack {
                        Button(action: {
                            withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                            {
                                chartData = "weight"
                            }
                        }) {
                            if chartData == "weight" {
                                Image(systemName: "scalemass.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                            } else {
                                Image(systemName: "scalemass")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 50, height: 40)
                        .background(chartData == "weight" ? Color(red: 61/255, green: 53/255, blue: 86/255) : .cornflowerBlue)
                        .cornerRadius(10)
                        .sensoryFeedback(.impact(weight: .light), trigger: chartData)
                        Button(action: {
                            withAnimation(.smooth(duration: 0.3, extraBounce: 0.3))
                            {
                                chartData = "excercise"
                            }
                        }) {
                            if chartData == "excercise" {
                                Image(
                                    systemName:
                                        "figure.strengthtraining.traditional"
                                )
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                            } else {
                                Image(
                                    systemName:
                                        "figure.strengthtraining.traditional"
                                )
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 50, height: 40)
                        .background(chartData == "excercise" ? Color(red: 61/255, green: 53/255, blue: 86/255) : .cornflowerBlue)
                        .cornerRadius(10)
                        .sensoryFeedback(.impact(weight: .light), trigger: chartData)
                        
                        
                        Button(action: {
                            withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                            {
                                chartData = "measurement"
                            }
                        }) {
                            if chartData == "measurement" {
                                Image(systemName: "ruler.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                            } else {
                                Image(systemName: "ruler")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 50, height: 40)
                        .background(chartData == "measurement" ? Color(red: 61/255, green: 53/255, blue: 86/255) : .cornflowerBlue)
                        .cornerRadius(10)
                        .sensoryFeedback(.impact(weight: .light), trigger: chartData)
                        
                    }
                    .frame(width: 200, height: 50)
                    .background(.cornflowerBlue)
                    .cornerRadius(5)
                    .padding(.bottom, 5)
                    .shadow(
                        color: .white.opacity(0.9),  // Soft, subtle shadow color
                        radius: 4,  // Blur radius
                        x: 0,  // Horizontal offset
                        y: 0  // Vertical offset (pushes shadow down)
                    )
                    Menu {
                        ForEach(bodyParts, id: \.self) { bp in
                            Button {
                                bodyPart = bp
                            } label: {
                                Text(bp)
                                    .font(
                                        .custom("Inder-Regular", size: 25)
                                    )
                            }
                        }
                    } label: {
                        HStack {
                            Text(bodyPart)
                                .frame(height: 40)
                                .foregroundStyle(.white)
                                .font(
                                    .custom("Inder-Regular", size: 25)
                                )
                                .padding(.leading, 5)
                            Spacer()
                        }
                        .frame(width: 200, height: 50)
                        .background(.darkBlue)
                        .cornerRadius(5)
                        .padding(.bottom, 5)
                        .shadow(
                            color: .white.opacity(0.9),  // Soft, subtle shadow color
                            radius: 4,  // Blur radius
                            x: 0,  // Horizontal offset
                            y: 0  // Vertical offset (pushes shadow down)
                        )
                    }
                    .offset(y: chartData == "weight" ? -200 : 1)
                }
                .frame(width: 420)
                .padding(.top, 5)
       
                if (!isLoading) {
                    VStack {
                        HStack {
                            Button {
                                chartDataFormat = "chart"
                            } label: {
                                Image(systemName: "chart.xyaxis.line")
                                    .font(.system(size: 20))
                                    .foregroundStyle(chartDataFormat == "chart" ? .white : .black)

                            }
                            .frame(width: 50, height: 30)
                            .background(chartDataFormat == "chart" ? .backgroundBlue : .skyBlue)
                            .cornerRadius(10)
                            .sensoryFeedback(.impact(weight: .light), trigger: chartDataFormat)
                            
                            Button {
                                chartDataFormat = "list"
                            } label: {
                                Image(systemName: "list.bullet")
                                    .font(.system(size: 20))
                                    .foregroundStyle(chartDataFormat == "list" ? .white : .black)
                            }
                            .frame(width: 50, height: 30)
                            .background(chartDataFormat == "list" ? .backgroundBlue : .skyBlue)
                            .cornerRadius(10)
                            .sensoryFeedback(.impact(weight: .light), trigger: chartDataFormat)
                        }
                        .frame(width: 120, height: 45)
                        .background(.skyBlue)
                        .cornerRadius(10)
                        .padding(.leading, 290)
                        .padding(.bottom, 5)
                        .padding(.top, -10)
                        Chart(weightData) { item in
                            LineMark(
                                x: .value("Date", item.date),
                                y: .value("Weight", item.weight)
                            )
                            PointMark(
                                x: .value("Date", item.date),
                                y: .value("Weight", item.weight)
                            )
                            // 3. Displays the weight value directly above each dot
                            .annotation(position: .leading, alignment: .center, spacing: 6) {
                                Text("\(item.weight, specifier: "%.1f")")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .frame(width: 405, height: 350)
                        .chartXAxis {
                            AxisMarks { value in
                                AxisValueLabel()
                                    .foregroundStyle(.white)
                                    .font(
                                        .custom(
                                            "PTSans-Narrow",
                                            size: 15
                                        )
                                    )
                            }
                        }
                        .chartYAxis {
                            AxisMarks { value in
                                AxisValueLabel()
                                    .foregroundStyle(.white)
                                    .font(
                                        .custom(
                                            "PTSans-Narrow",
                                            size: 20
                                        )
                                    )
                            }
                        }
                        .chartYScale(domain: 180...210)
                    }
                    .frame(width: 420, height: 430)
                    .background(chartColor)
                    .cornerRadius(10)
                    .shadow(
                        color: .white.opacity(0.9),  // Soft, subtle shadow color
                        radius: 4,  // Blur radius
                        x: 0,  // Horizontal offset
                        y: 0  // Vertical offset (pushes shadow down)
                    )
                }
                HStack {
                    Button {
                        selectedInterval = "1M"
                    } label: {
                        Text("1M")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 20
                                )
                            )
                    }
                    .background(selectedInterval == "1M" ? .cornflowerBlue : .backgroundBlue)
                    .cornerRadius(10)
                    .foregroundStyle(selectedInterval == "1M" ? .black : .cornflowerBlue)
                    .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)
                    
                    Button {
                        selectedInterval = "3M"
                    } label: {
                        Text("3M")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 20
                                )
                            )
                    }
                    .background(selectedInterval == "3M" ? .cornflowerBlue : .backgroundBlue)
                    .cornerRadius(10)
                    .foregroundStyle(selectedInterval == "3M" ? .black : .cornflowerBlue)
                    .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)
                    
                    Button {
                        selectedInterval = "YTD"
                    } label: {
                        Text("YTD")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 20
                                )
                            )
                    }   .background(selectedInterval == "YTD" ? .cornflowerBlue : .backgroundBlue)
                        .cornerRadius(10)
                        .foregroundStyle(selectedInterval == "YTD" ? .black : .cornflowerBlue)
                        .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)
                    
                    Button {
                        selectedInterval = "1Y"
                    } label: {
                        Text("1Y")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 20
                                )
                            )
                    }
                    .background(selectedInterval == "1Y" ? .cornflowerBlue : .backgroundBlue)
                    .cornerRadius(10)
                    .foregroundStyle(selectedInterval == "1Y" ? .black : .cornflowerBlue)
                    .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)
                    
                    Button {
                        selectedInterval = "ALL"
                    } label: {
                        Text("ALL")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 20
                                )
                            )
                    }
                    .background(selectedInterval == "ALL" ? .cornflowerBlue : .backgroundBlue)
                        .cornerRadius(10)
                        .foregroundStyle(selectedInterval == "ALL" ? .black : .cornflowerBlue)
                        .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)
                    
                }
                .padding(.top, 20)
                .cornerRadius(10)
                .background(.backgroundBlue)
                HStack {
                    Spacer()
                    VStack {
                        Text("\(String(format: "%.1f", lowestWeight))")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 50
                                )
                            )
                        Text("Lowest")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "Poppins-Bold",
                                    size: 40
                                )
                            )
                            .foregroundStyle(.darkBlue)
                    }
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                        .frame(width: 5, height: 180)
                    VStack {
                        Text("\(String(format: "%.1f", highestWeight))")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "PTSans-Narrow",
                                    size: 50
                                )
                            )
                        Text("Highest")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(
                                .custom(
                                    "Poppins-Bold",
                                    size: 40
                                )
                            )
                            .foregroundStyle(.darkBlue)
                        
                    }
                    Spacer()
                }
                .frame(width: 420, height: 180)
                .background(.calendarAccent)
                .cornerRadius(10)
                .padding(.top, 30)
                .shadow(
                    color: .white.opacity(0.9),  // Soft, subtle shadow color
                    radius: 4,  // Blur radius
                    x: 0,  // Horizontal offset
                    y: 0  // Vertical offset (pushes shadow down)
                )
                Spacer()
            }
            .frame(width: 500, height: 800)
          //  .background(chartColor)
            .cornerRadius(10)
            .padding(.bottom, -20)
        }
        .task {
            await fetchChartData()
        }
    }
}

#Preview {
    ChartView()
}
