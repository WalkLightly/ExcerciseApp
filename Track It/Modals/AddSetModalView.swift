//
//  AddSetModalView.swift
//  Track It
//
//  Created by Michael Knight on 6/7/26.
//

import SwiftUI

struct AddSetModalView: View {
    @Binding var newSetWeight : String
    @Binding var showAddSetModal: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {

                    } label: {
                        Text("💀")
                            .font(
                                Font.system(
                                    size: 60,
                                    weight: .bold,
                                    design: .default
                                )
                            )
                            .offset(y: 5)
                    }
                    .background(
                        Rectangle()
                            .fill(Color.black.opacity(0.3))
                            .frame(width: 1, height: 110),
                        alignment: .trailing
                    )
                    VStack {
                        VStack {

                            TextField("", text: $newSetWeight)
                                .frame(width: 150, height: 55)
                                .foregroundStyle(.darkBlue)
                                .font(
                                    .custom("Inder-Regular", size: 40)
                                )
                                .multilineTextAlignment(.trailing)
                                .padding(5)
                                .padding(.trailing, 15)
                        }
                        .frame(width: 150, height: 55)
                        .background(Color.brown.brightness(-0.05))
                        .offset(y: -18)
                    }
                    .padding(.top, 50)
                    Text("lbs")
                        .font(.custom("Inder-Regular", size: 35))
                        .foregroundStyle(.darkBlue)
                        .padding(.top, 10)

                }
                .frame(width: 300, height: 110)
                .background(
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(height: 1),
                    alignment: .bottom
                )
                HStack {
                    Button {
                        //showConfirmDeleteDialog = false
                        showAddSetModal = false
                    } label: {
                        Text("Delete")
                            .foregroundStyle(
                                Color(
                                    red: 195 / 255,
                                    green: 27 / 255,
                                    blue: 4 / 255
                                )
                            )
                            .font(.custom("Inder-Regular", size: 23))
                    }
                    .frame(width: 130)
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(width: 1, height: 55)
                    Button {
                        // showConfirmDeleteDialog = false
                    } label: {
                        Text("Save")
                            .font(.custom("Inder-Regular", size: 23))
                            .foregroundStyle(.primaryBlue)
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
        }
        .frame(width: 600, height: 1000)
        .background(.black.opacity(0.7))
    }
}

#Preview {
    AddSetModalView(newSetWeight: .constant(""), showAddSetModal: .constant(true))
}
