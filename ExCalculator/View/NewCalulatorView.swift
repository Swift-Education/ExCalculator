//
//  NewCalulatorView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/7/24.
//

import SwiftUI

struct NewCalulatorView: View {
    @ObservedObject private var model: CalculatorModel = .init()
    private let buttonTitles: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"],
    ]
    
    var body: some View {
        Spacer()
        Text(model.resultBuffer)
            .font(.system(size: 60))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
        Spacer()
        
        VStack {
            ForEach(0..<buttonTitles.count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0..<buttonTitles[rowIndex].count, id: \.self) { columnIndex in
                        let buttonTitle = buttonTitles[rowIndex][columnIndex]
                        let grayColor = Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
                        let orangeColor = Color.orange
                        let operatorTitles: Set<String> = ["+", "-", "*", "/", "AC", "="]
                        let backgroundColor = operatorTitles.contains(buttonTitle) ? orangeColor : grayColor
                        Button(action: { model.tappedKeyPadButton(with: buttonTitle) }) {
                            Text(buttonTitle)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(backgroundColor)
                        .cornerRadius(50)
                    }
                }
            }
        }
        .padding(.all)
    }
}

#Preview {
    NewCalulatorView()
}
