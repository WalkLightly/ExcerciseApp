//
//  AddItem.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import SwiftUI

struct AddItem: View {
    //@StateObject var viewModel = NewItemViewModel()

    @State private var tab = "excercise"
    @State private var xOffset = -116
    @State private var chosenFont = "PTSans-Narrow"

    // excercise obj
    @State private var eName: String = ""
    @State private var location: String = ""
    @State private var muscleGroup: [String] = []
    @State private var mscGroupTxt = ""

    // measurement obj
    @State private var bodyPart: String = ""
    @State private var measurement: String = ""
    @State private var measurementDate: Date = Date()

    // weight obj
    @State private var weight: String = ""
    @State private var weighDate: Date = Date()

    // muslegroup obj
    @State private var muscName: String = ""
    @State private var excercises: [String] = []

    //scalemass ruler figure.strengthtraining.traditional figure list.clipboard
    var body: some View {
        ZStack {
            VStack {

                VStack {
                    if tab == "excercise" {
                        Spacer()
                        VStack {
                            Grid {
                                GridRow {
                                    VStack(alignment: .leading) {
                                        Text("Name")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        TextField("", text: $eName)
                                            .frame(width: 350, height: 40)
                                            .foregroundStyle(.white)
                                            .font(.custom(chosenFont, size: 20))
                                            .padding(.leading, 5)
                                            .padding(.top, -15)
                                        Rectangle()
                                            .fill(.darkBlue)
                                            .frame(width: 350, height: 2)
                                            .offset(y: -10)
                                    }
                                }
                                GridRow {
                                    VStack(alignment: .leading) {
                                        Text("Location")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        TextField("", text: $location)
                                            .frame(width: 350, height: 40)
                                            .foregroundStyle(.white)
                                            .font(.custom(chosenFont, size: 20))
                                            .padding(.leading, 5)
                                            .padding(.top, -15)
                                        Rectangle()
                                            .fill(.darkBlue)
                                            .frame(width: 350, height: 2)
                                            .offset(y: -10)
                                    }
                                }
                                .padding(.top, 10)
                                GridRow {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Muscle Groups")
                                                .foregroundStyle(.darkBlue)
                                                .font(
                                                    .custom(
                                                        chosenFont,
                                                        size: 20
                                                    )
                                                )
                                            TextField("", text: $mscGroupTxt)
                                                .frame(width: 250, height: 40)
                                                .foregroundStyle(.white)
                                                .font(
                                                    .custom(
                                                        chosenFont,
                                                        size: 20
                                                    )
                                                )
                                                .padding(.leading, 5)
                                                .padding(.top, -15)
                                            //.focused($showGenresAvailable)

                                            Rectangle()
                                                .fill(.darkBlue)
                                                .frame(width: 250, height: 2)
                                                .opacity(0.7)
                                                .offset(y: -10)
                                        }
                                        Button {
                                            muscleGroup.append(mscGroupTxt)
                                            mscGroupTxt = ""
                                        } label: {
                                            Text("Add")
                                                .font(
                                                    .custom(
                                                        chosenFont,
                                                        size: 25
                                                    )
                                                )
                                                .frame(width: 90, height: 40)
                                                .foregroundColor(
                                                    mscGroupTxt == ""
                                                        ? .gray : .pinkAccent
                                                )
                                        }
                                        .disabled(mscGroupTxt == "")
                                    }
                                }
                                GridRow {
                                    ScrollView {
                                        HStack(spacing: 10) {
                                            ForEach(muscleGroup, id: \.self) {
                                                mscGrp in
                                                Text(mscGrp)
                                                    .frame(height: 15)
                                                    .font(
                                                        .custom(
                                                            chosenFont,
                                                            size: 18
                                                        )
                                                    )
                                                    .padding(10)
                                                    .background(.grayBlue)
                                                    .foregroundStyle(.black)
                                                    .cornerRadius(10)
                                                    .shadow(
                                                        color: Color.black
                                                            .opacity(0.15),
                                                        radius: 2,
                                                        x: 3,
                                                        y: 4
                                                    )
                                                    .onTapGesture {
                                                        muscleGroup =
                                                            muscleGroup.filter {
                                                                $0 != mscGrp
                                                            }
                                                    }
                                            }
                                        }
                                        .frame(width: 350, alignment: .leading)
                                    }
                                    .padding(.leading, 12)
                                    .frame(height: 60)
                                }
                                GridRow {
                                    Button {
                                        // addItem()
                                    } label: {
                                        Text("Add Excercise")
                                            .frame(width: 350, height: 50)
                                            .background(
                                                eName == ""
                                                    || muscleGroup.count == 0
                                                    ? .gray : .steelBlue
                                            )
                                            .font(.custom(chosenFont, size: 20))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                    }
                                    .padding(.top, 20)
                                    .disabled(
                                        eName == "" || muscleGroup.count == 0
                                    )

                                }
                            }
                        }
                        .frame(width: 380, height: 440)
                        .transition(
                            .move(edge: .leading).combined(with: .opacity)
                        )
                        .background(.skyBlue)
                        .cornerRadius(20)
                    } else if tab == "weight" {
                        Spacer()
                        VStack {
                            Grid {
                                GridRow {
                                    VStack(alignment: .leading) {
                                        Text("Weight")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        TextField("", text: $weight)
                                            .frame(width: 350, height: 40)
                                            .foregroundStyle(.white)
                                            .font(.custom(chosenFont, size: 20))
                                            .padding(.leading, 5)
                                            .padding(.top, -15)
                                        Rectangle()
                                            .fill(.darkBlue)
                                            .frame(width: 350, height: 2)
                                            .offset(y: -10)
                                    }
                                }
                                GridRow {
                                    HStack {
                                        Text("Date: ")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        VStack {
                                            
                                        Text(weighDate.formatted())
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                         
                                            .padding(5)
                                        }
                                        .frame(width: 180)
                                        .background(.grayBlue)
                                        .cornerRadius(10)
                                        Spacer()
                                    }
                                    .frame(width: 380, height: 40)
                                    .padding(.leading, 30)

                                }
                                GridRow {
                                    Button {
                                        // addItem()
                                    } label: {
                                        Text("Add Weight")
                                            .frame(width: 350, height: 50)
                                            .background(
                                                weight == ""
                                                    ? .gray : .steelBlue
                                            )
                                            .font(.custom(chosenFont, size: 20))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                    }
                                    .padding(.top, 20)
                                    .disabled(weight == "")

                                }
                            }
                        }
                        .frame(width: 380, height: 290)
                        .transition(
                            .move(edge: .leading).combined(with: .opacity)
                        )
                        .background(.skyBlue)
                        .cornerRadius(20)
                    } else if (tab == "measurement") {
                        Spacer()
                        VStack {
                            Grid {
                                GridRow {
                                    VStack(alignment: .leading) {
                                        Text("Body Part")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        TextField("", text: $weight)
                                            .frame(width: 350, height: 40)
                                            .foregroundStyle(.white)
                                            .font(.custom(chosenFont, size: 20))
                                            .padding(.leading, 5)
                                            .padding(.top, -15)
                                        Rectangle()
                                            .fill(.darkBlue)
                                            .frame(width: 350, height: 2)
                                            .offset(y: -10)
                                    }
                                }
                                GridRow {
                                    VStack(alignment: .leading) {
                                        Text("Measurement (inches)")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        TextField("", text: $weight)
                                            .frame(width: 350, height: 40)
                                            .foregroundStyle(.white)
                                            .font(.custom(chosenFont, size: 20))
                                            .padding(.leading, 5)
                                            .padding(.top, -15)
                                        Rectangle()
                                            .fill(.darkBlue)
                                            .frame(width: 350, height: 2)
                                            .offset(y: -10)
                                    }
                                }
                                GridRow {
                                    HStack {
                                        Text("Date: ")
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                        VStack {
                                            
                                        Text(weighDate.formatted())
                                            .foregroundStyle(.darkBlue)
                                            .font(.custom(chosenFont, size: 20))
                                         
                                            .padding(5)
                                        }
                                        .frame(width: 180)
                                        .background(.grayBlue)
                                        .cornerRadius(10)
                                        Spacer()
                                    }
                                    .frame(width: 380, height: 40)
                                    .padding(.leading, 30)

                                }
                                GridRow {
                                    Button {
                                        // addItem()
                                    } label: {
                                        Text("Add Measurement")
                                            .frame(width: 350, height: 50)
                                            .background(
                                                weight == ""
                                                    ? .gray : .steelBlue
                                            )
                                            .font(.custom(chosenFont, size: 20))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                    }
                                    .padding(.top, 20)
                                    .disabled(weight == "")

                                }
                            }
                        }
                        .frame(width: 380, height: 350)
                        .transition(
                            .move(edge: .leading).combined(with: .opacity)
                        )
                        .background(.skyBlue)
                        .cornerRadius(20)
                    }
                }
                .frame(width: 380, height: 500)

                HStack {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.3))
                        {
                            tab = "excercise"
                            xOffset = -116
                        }
                    }) {
                        if tab == "excercise" {
                            Image(
                                systemName:
                                    "figure.strengthtraining.traditional"
                            )
                            .font(.system(size: 20))
                            .foregroundStyle(.darkBlue)
                        } else {
                            Image(
                                systemName:
                                    "figure.strengthtraining.traditional"
                            )
                            .font(.system(size: 20))
                            .foregroundStyle(.steelBlue.opacity(0.5))
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    // body part
                    //                    Button(action: {
                    //                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                    //                        {
                    //                            tab = "muscle"
                    //                            xOffset = -58
                    //                        }
                    //                    }) {
                    //                        if tab == "muscle" {
                    //                            Image(systemName: "figure")
                    //                                .font(.system(size: 20))
                    //                                .foregroundStyle(.darkBlue)
                    //                        } else {
                    //                            Image(systemName: "figure")
                    //                                .font(.system(size: 20))
                    //                                .foregroundStyle(.steelBlue.opacity(0.5))
                    //                        }
                    //                    }
                    //                    .frame(width: 50, height: 40)
                    //                    .cornerRadius(50)
                    //                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "weight"
                            xOffset = 0
                        }
                    }) {
                        if tab == "weight" {
                            Image(systemName: "scalemass.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.darkBlue)
                        } else {
                            Image(systemName: "scalemass")
                                .font(.system(size: 20))
                                .foregroundStyle(.steelBlue.opacity(0.5))
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "measurement"
                            xOffset = 59
                        }
                    }) {
                        if tab == "measurement" {
                            Image(systemName: "ruler.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.darkBlue)
                        } else {
                            Image(systemName: "ruler")
                                .font(.system(size: 20))
                                .foregroundStyle(.steelBlue.opacity(0.5))
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)

                }
                .frame(width: 180, height: 50)
                .background(.pinkAccent.opacity(0.7))
                .cornerRadius(30)
            }
        }
        .onAppear {
            tab = "measurement"
        }
    }
}

#Preview {
    AddItem()
}
