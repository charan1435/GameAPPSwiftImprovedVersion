//
//  GameView.swift
//  MockTestRecheck
//
//  Created by Sabith Salman on 2024-11-26.
//

import SwiftUI
enum MathOperators: String, CaseIterable {
    case addition = "+"
    case substraction = "-"
    case multiplication = "*"
    case division = "/"
}
struct GameView: View {
    @State var  feedbackMessage: String = ""
    @State var showFeedbackImage: String = ""
    @Binding var selectedFontColor : AppThemeColour
    @State var firstNumber : Int = Int.random(in:0...9)
    @State var secondNumber : Int = Int.random(in:0...9)
    @State var mathOperator : MathOperators =  MathOperators.allCases.randomElement()!
    @State var enteredValue : Int? = nil
    @State var correctValue : Int? = nil
    @AppStorage("PointsStored") var points : Int = 0
    @Binding var fontSize : Double
    @State var submitBtnDisabled : Bool = false
    var body: some View {
        VStack{
            Text("Guess the Answer!")
                .foregroundColor(convertColor())
                .font(.system(size: 25))
                .bold()
                .padding()
            Text("What is \(firstNumber) \(mathOperator.rawValue) \(secondNumber) ?")
                .bold()
                .font(.system(size:20 ))
       
            HStack{
                TextField("Enter the Answer",value : $enteredValue, format : .number)
                Button("Submit"){
                    if(enteredValue == correctValue ){
                        feedbackMessage = "Correct!"
                        showFeedbackImage = "checkmark"
                        points += 1
                        submitBtnDisabled=true
                    }else{
                        feedbackMessage = "Wrong!"
                        showFeedbackImage = "xmark"
                        if (points > 0) {
                            points -= 1
                        }
                        submitBtnDisabled = true
                        
                    }
                    
                }
                .buttonBorderShape(.roundedRectangle)
                .tint(.blue)
                .buttonStyle(.bordered)
                .padding()
                .disabled(submitBtnDisabled)
                
            }
            .border(Color.black, width: 1)
            .padding()
            
            if showFeedbackImage != "" {
                HStack{
                    Image(systemName: showFeedbackImage)
                        .tint(.green)
                    
                    Text("\(feedbackMessage)")
                        .foregroundColor(.green)
                }
                
            }
            
            
            Text("\(points)")
                .font(.system(size: 150))
            Text("submit the correct answer and gain 1 point. Submit a wrong answer or press on \"Next\" and you will lose 1 point.")
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .padding()
                .font(.system(size: fontSize))
            
            Button("Next"){
                submitBtnDisabled = false
                showFeedbackImage = ""
                feedbackMessage = ""
                getRandomNumber()
                
            }
            .buttonStyle(.bordered)
            .tint(.green)
        }
        
        .onAppear(){
            getRandomNumber()
        }
    }
    func getRandomNumber() {
        firstNumber = Int.random(in: 0...9)
        secondNumber = Int.random(in: 0...9)
        mathOperator = MathOperators.allCases.randomElement()!
        
        switch mathOperator{
        case .addition :
            correctValue = firstNumber + secondNumber
        case .substraction :
            correctValue = firstNumber - secondNumber
        case .multiplication :
            correctValue = firstNumber * secondNumber
        case .division :
            guard  secondNumber !=  0  else {
                getRandomNumber()
                return
            }
            correctValue = firstNumber / secondNumber
            
        }
        
        
        
    }
    
    func convertColor() -> Color {
        switch selectedFontColor {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        }
    }
    
    
    
}

#Preview {
    GameView(selectedFontColor: .constant(.red), fontSize: .constant(20.0))
}
