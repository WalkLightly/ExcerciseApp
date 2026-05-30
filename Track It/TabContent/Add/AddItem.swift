//
//  AddItem.swift
//  Track It
//
//  Created by Michael Knight on 5/30/26.
//
import SwiftUI

struct AddItem: View {
    @State private var tab = ""
    @State private var xOffset = -116
    //scalemass ruler figure.strengthtraining.traditional figure list.clipboard
    var body: some View {
        ZStack {
            VStack {
                
                VStack {
                    if (tab == "") {
                        
                    }
                }
                .frame(width: 380, height: 500)
                .background(.darkBlue)
                .cornerRadius(20)
                HStack {
                    Button(action: {
                        withAnimation(.smooth(duration: 0.3, extraBounce: 0.4))
                        {
                            tab = "excercise"
                            xOffset = -116
                        }
                    }) {
                        if tab == "excercise" {
                            Image(systemName: "figure.strengthtraining.traditional")
                                .font(.system(size: 20))
                                .foregroundStyle(.primaryBlue)
                        } else {
                            Image(systemName: "figure.strengthtraining.traditional")
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
                            tab = "muscle"
                            xOffset = -58
                        }
                    }) {
                        if tab == "muscle" {
                            Image(systemName: "figure")
                                .font(.system(size: 20))
                                .foregroundStyle(.primaryBlue)
                        } else {
                            Image(systemName: "figure")
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
                            tab = "weight"
                            xOffset = 0
                        }
                    }) {
                        if tab == "weight" {
                            Image(systemName: "scalemass.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.primaryBlue)
                        } else {
                            Image(systemName: "scalemass")
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
                            tab = "measurement"
                            xOffset = 59
                        }
                    }) {
                        if tab == "measurement" {
                            Image(systemName: "ruler.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.primaryBlue)
                        } else {
                            Image(systemName: "ruler")
                                .font(.system(size: 20))
                                .foregroundStyle(.skyBlue)
                        }
                    }
                    .frame(width: 50, height: 40)
                    .cornerRadius(50)
                    .sensoryFeedback(.impact(weight: .light), trigger: tab)
                    
                }
                .frame(width: 250, height: 50)
                .background(.pinkAccent.opacity(0.7))
                .cornerRadius(30)
            }
        }
        .onAppear() {
            tab = ""
        }
    }
}

#Preview {
    AddItem()
}
