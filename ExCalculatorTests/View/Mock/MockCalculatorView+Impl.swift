//
//  MockCalculatorView.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import Foundation
@testable import ExCalculator

protocol MockCalculatorView: CalculatorViewAble {
    var receivedResult: String? { get set }
    
    func tappedKeypad(with title: String)
}

// Mock View
final class MockCalculatorViewImpl: MockCalculatorView {
    var keypadView: MockKeypadView
    var receivedResult: String?
    
    init(keypadView: MockKeypadView) {
        self.keypadView = keypadView
    }
    func setDelegate(_ target: any ExCalculator.KeypadViewDelegate) {
        keypadView.delegate = target
    }
    
    func tappedKeypad(with title: String) {
        keypadView.delegate?.tappedKeyPadButton(with: title)
    }
    
    func setResultLabel(to value: String) {
        receivedResult = value
    }
}

protocol MockKeypadView {
    var delegate: KeypadViewDelegate? { get set }
}

final class MockKeypadViewImpl: MockKeypadView {
    weak var delegate: KeypadViewDelegate?
}
