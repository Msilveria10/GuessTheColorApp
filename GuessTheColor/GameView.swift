//
//  ContentView.swift
//  GuessTheColor
//
//  Created by Matt Silveria on 7/22/22.
//

import SwiftUI

struct GameView: View {
    // Variables
    @State private var currentColor = Color.green
    @State private var alertIsVisible = false
    @State var allColors: [Color] = [.blue, .yellow, .green, .red, .purple, .orange]

    @State var colorMatch = false
    
    

    
    // MARK: Body
    var body: some View {
        
        VStack {
            VStack {
                Text("Match The Color!")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .padding(.bottom, 25)
                    .padding(.top, 50)
                    .padding()
                Rectangle()
                    .frame(width: 350, height: 250.0)
                    .scaledToFit()
                    .foregroundColor(currentColor)
                    .cornerRadius(35)
                    .shadow(color: .gray, radius: 10, x: 2, y: 5)
                    .padding()
            }
            Spacer()
            VStack {
                VStack {
                    HStack {
                        ButtonView(buttonColor: .blue, buttonName: "Blue") {
                            showAlert(colorName: .blue)
                        }
                        
                        ButtonView(buttonColor: .yellow, buttonName: "Yellow") {
                            showAlert(colorName: .yellow)
                        }
                        
                        ButtonView(buttonColor: .green, buttonName: "Green") {
                            showAlert(colorName: .green)
                        }
                    }
                    .padding(11.0)
                    HStack {
                        ButtonView(buttonColor: .red, buttonName: "Red") {
                            showAlert(colorName: .red)
                        }
                        
                        ButtonView(buttonColor: .purple, buttonName: "Purple") {
                            showAlert(colorName: .purple)
                        }
                        
                        ButtonView(buttonColor: .orange, buttonName: "Orange") {
                            showAlert(colorName: .orange)
                        }
                    }
                    .padding(.bottom, 50.0)
                }
                Button("Next Color") {
                 
                    let availibleColors = allColors.filter { nextColor in
                        if currentColor == nextColor {
                            return false
                        } else {
                            return true
                        }
                    }
                    
                 currentColor = availibleColors.randomElement()!
                    
                    
                }
                    
                .padding()
                .frame(width: 150.0, height: 50.0)
                .border(.black)
                .foregroundColor(.black)
                
                
                
                .padding(.bottom, 50.0)
            }
        }
        .alert(isPresented: $alertIsVisible, content: {
            
            return Alert(title: Text(colorMatch ? "Good Work!" : "That is not correct"), dismissButton: .default(Text("Ok")))
        })
    }
    
    func showAlert(colorName: Color) {
        alertIsVisible = true
        colorMatch = (currentColor == colorName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
