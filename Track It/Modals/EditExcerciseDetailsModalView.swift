//
//  EditExcerciseDetailsModalView.swift
//  Track It
//
//  Created by Michael Knight on 10/3/26.
//

import SwiftUI

struct EditExcerciseDetailsModalView: View {
    @Binding var name: String
    @Binding var startingWeight: String
    @Binding var showEditModal: Bool
    let updateDetails: () -> Void
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack {
                        VStack {
                            TextField("", text: $name)
                                .frame(width: 370, height: 55)
                                .foregroundStyle(.darkBlue)
                                .font(
                                    .custom("Inder-Regular", size: 25)
                                )
                                .multilineTextAlignment(.trailing)
                                .padding(5)
                                .padding(.trailing, 10)
                        }
                        .frame(width: 370, height: 55)
                        .background(Color.brown.brightness(-0.05))
                        .offset(y: -18)
                        VStack {
                            TextField("", text: $startingWeight)
                                .frame(width: 370, height: 25)
                                .foregroundStyle(.darkBlue)
                                .font(
                                    .custom("Inder-Regular", size: 25)
                                )
                                .multilineTextAlignment(.trailing)
                                .padding(5)
                                .padding(.trailing, 10)
                        }
                        .frame(width: 370, height: 55)
                        .background(Color.brown.brightness(-0.05))
                    }
                    .padding(.top, 70)
                    .padding(.bottom, 30)

                }
                .frame(width: 490, height: 200)
                .background(
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(height: 1),
                    alignment: .bottom
                )
                
                HStack {
                    Button {
                        showEditModal = false
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(
                                Color(
                                    red: 195 / 255,
                                    green: 27 / 255,
                                    blue: 4 / 255
                                )
                            )
                            .font(.custom("Inder-Regular", size: 30))
                            .padding(.trailing, 40)

                    }
                    .frame(width: 160)
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(width: 1, height: 65)
                        .padding(.top, 8)
                    Button {
                        // showConfirmDeleteDialog = false
                        showEditModal = false
                       // updateDetails()
                    } label: {
                        Text("Save")
                            .font(.custom("Inder-Regular", size: 30))
                            .foregroundStyle(.primaryBlue)
                            .padding(.leading, 40)
                    }
                    .frame(width: 130)
                }
                .frame(width: 300, height: 40)
                .padding(.bottom, 40)
            }
            .frame(width: 400, height: 240)
            .background(.brown)
            .cornerRadius(20)
            .offset(x: 0, y: 50)
        }
        .frame(width: 600, height: 1000)
        .background(.black.opacity(0.7))
    }
}

#Preview {
    EditExcerciseDetailsModalView(name: .constant("Single Leg Seated Leg Press"), startingWeight: .constant("255"), showEditModal: .constant(true), updateDetails: {})
}
