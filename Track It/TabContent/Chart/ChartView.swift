//
//  ChartView.swift
//  Track It
//
//  Created by Michael Knight on 9/18/26.
//

import SwiftUI
import Charts

struct MonthlyHoursOfSunshine: Identifiable {
    var date: Date
    var hoursOfSunshine: Double
    var id: Date


    init(month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
        self.id = date
    }
}


var data: [MonthlyHoursOfSunshine] = [
    MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
    MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 99),
    // ...
    MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)
]
struct ChartView: View {
    
    @State private var selectedInterval: String = "1M"
    
    var body: some View {
        VStack {
            Chart(data) {
                   LineMark(
                       x: .value("Month", $0.date),
                       y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                   )
               }
            .frame(width: 380, height: 400)
            .chartXAxis {
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
                .background(selectedInterval == "1M" ? .cornflowerBlue : .darkBlue)
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
                .background(selectedInterval == "3M" ? .cornflowerBlue : .darkBlue)
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
                }   .background(selectedInterval == "YTD" ? .cornflowerBlue : .darkBlue)
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
                .background(selectedInterval == "1Y" ? .cornflowerBlue : .darkBlue)
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
                }   .background(selectedInterval == "ALL" ? .cornflowerBlue : .darkBlue)
                    .cornerRadius(10)
                    .foregroundStyle(selectedInterval == "ALL" ? .black : .cornflowerBlue)
                    .sensoryFeedback(.impact(weight: .light), trigger: selectedInterval)

            }
            .padding(.top, 20)
            
        }
        .frame(width: 400, height: 650)
        .background(.darkBlue)
        .cornerRadius(10)
        .shadow(
            color: .white.opacity(0.9),  // Soft, subtle shadow color
            radius: 4,  // Blur radius
            x: 0,  // Horizontal offset
            y: 0  // Vertical offset (pushes shadow down)
        )
    }
}

#Preview {
    ChartView()
}
