//
//  ExcerciseDay.swift
//  Track It
//
//  Created by Michael Knight on 6/1/26.
//

import SwiftUI

struct ExcerciseDay: View {
    var body: some View {
        VStack {
            HStack {
                Text("Excercises for the day")
                    .font(.custom("PTSans-NarrowBold", size: 35))
                    .padding(.top, 5)
                    .padding(.leading, 20)
                Spacer()
                Button {

                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.darkBlue)
                        .font(.system(size: 40))
                }
                .padding(.top, 5)
                .padding(.trailing, 15)
            }
            ScrollView {
                HStack(alignment: .top) {
                    Rectangle()
                        .fill(.shouldersAccent)
                        .frame(width: 20)
                    VStack(alignment: .leading) {
                        HStack {
                            VStack {
                                Text("Shoulders")
                                    .font(.custom("PTSans-Narrow", size: 35))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }
                            .background(.darkBlue)
                            .cornerRadius(5)
                            .padding(5)
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.darkBlue)
                                    .font(.system(size: 30))
                            }
                            .padding(.top, 5)
                            .padding(.trailing, 15)
                        }
                        ScrollView {
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 18)
                                        )
                                        .foregroundStyle(.darkBlue)
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 20))
                                    }
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            )
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            ).padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            ).padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            )
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 20)
                    }
                    Spacer()

                }
                .frame(width: 380, height: 300)
                
                .background(.offWhite)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 10,
                        topTrailingRadius: 10
                    )
                )
                .shadow(
                    color: Color.black.opacity(0.7),
                    radius: 5,
                    x: 1,
                    y: 2
                )
                .padding()

                HStack(alignment: .top) {
                    Rectangle()
                        .fill(.legsAccent)
                        .frame(width: 20)
                    VStack(alignment: .leading) {
                        HStack {
                            VStack {
                                Text("Legs")
                                    .font(.custom("PTSans-Narrow", size: 35))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }
                            .background(.darkBlue)
                            .cornerRadius(5)
                            .padding(5)
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.darkBlue)
                                    .font(.system(size: 30))
                            }
                            .padding(.top, 5)
                            .padding(.trailing, 15)
                        }
                        ScrollView {
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            )
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            ).padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            ).padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                            VStack {
                                HStack {
                                    Text("Romanian Dead Lift")
                                        .font(
                                            .custom("Inder-Regular", size: 12)
                                        )
                                    Button {

                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.darkBlue)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.top, 5)
                                    .padding(.trailing, 15)
                                }
                                Spacer()
                            }
                            .frame(width: 320, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.4),  // Soft, subtle shadow color
                                radius: 2,  // Blur radius
                                x: 1,  // Horizontal offset
                                y: 2  // Vertical offset (pushes shadow down)
                            )
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                            .padding(.bottom, 5)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 20)
                    }
                    Spacer()

                }
                .frame(width: 380, height: 300)
                
                .background(.offWhite)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 10,
                        topTrailingRadius: 10
                    )
                )
                .shadow(
                    color: Color.black.opacity(0.7),
                    radius: 5,
                    x: 1,
                    y: 2
                )
                .padding()
            }

        }
        .frame(width: 400, height: 500)
        .background(.cornflowerBlue)
        .cornerRadius(10)
    }
}

#Preview {
    ExcerciseDay()
}
