//
//  CalculatorModel.swift
//  ExCalculator
//
//  Created by 강동영 on 12/6/24.
//

import SwiftUI

final class CalculatorModel: ObservableObject {
    @Published private(set) var resultBuffer: String = "0"
    
    private let buttonTitles: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"],
    ]
    
    func getTitles() -> [[String]] {
        return buttonTitles
    }
    
    private let operatorTitles: Set<String> = ["+", "-", "*", "/", "=", "AC"]
    
    func tappedKeyPadButton(with buttonTitle: String) {
        switch buttonTitle {
        case let `operator` where operatorTitles.contains(`operator`):
            guard resultBuffer.last!.isNumber else { return }
            if `operator` == "AC" {
                resultBuffer = "0"
            } else if `operator` == "=" {
                guard let result = calculate(expression: resultBuffer) else { return }
                resultBuffer = result.description
            } else {
                resultBuffer.append(`operator`)
            }
            print(`operator`)
        default:
            guard !(buttonTitle == "0" && resultBuffer == "0") else { return }
            if resultBuffer.count == 1, resultBuffer == "0" {
                resultBuffer = ""
            }
            resultBuffer.append(buttonTitle)
            
            print(buttonTitle)
        }
    }
    
    private func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
