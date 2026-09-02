//
//  MeasurementView.swift
//  Track It
//
//  Created by Michael Knight on 9/1/26.
//

import Foundation
import SwiftUI

struct MeasurementView: View {
    let measurements: [Measurement]
    
    var body: some View {
        
        VStack {
            ForEach(measurements, id: \.id) { measurement in
                HStack {
                    HStack {
                        Text(measurement.bodyPart)
                            .font(.custom("PTSans-NarrowBold", size: 30))
                            .foregroundStyle(.black)
                        Spacer()

                    }
                    .frame(width: 200)
                    VStack {
                        Text(measurement.measurement)
                            .font(.custom("PTSans-Narrow", size: 30))
                            .foregroundStyle(.white)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                    }
                    .background(.darkBlue)
                    .cornerRadius(10)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, 5)
            }
            .padding(.top, 5)
            Spacer()
        }
        .frame(width: 350, height: 700)
        .background(.white)
        .cornerRadius(20)
        .shadow(
            color: .black.opacity(0.9),
            radius: 100,
            x: 5,
            y: 10
        )
    }
}

#Preview {
    MeasurementView(measurements: [sampleMeasurement, sampleMeasurement2, sampleMeasurement3])
}
