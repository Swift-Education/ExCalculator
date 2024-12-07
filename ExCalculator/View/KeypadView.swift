//
//  KeypadView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/7/24.
//

import SwiftUI

struct KeypadView: View {
    private var model: CalculatorModel
    
    init(model: CalculatorModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            let buttonTitles = model.getTitles()
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
    }
}
