//
//  MockCalculatorModel.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import Foundation
@testable import ExCalculator

protocol MockCalculatorModel {
    var receivedInput: String? { get set }
    var didChangedResultBuffer: ((String) -> Void)? { get set }
    func tappedKeyPadButton(with buttonTitle: String)
}

// Mock Model
final class MockCalculatorModelImpl: MockCalculatorModel {
    var receivedInput: String? {
        didSet {
            didChangedResultBuffer?(self.receivedInput!)
        }
    }
    var didChangedResultBuffer: ((String) -> Void)?
    func tappedKeyPadButton(with buttonTitle: String) {
        receivedInput = buttonTitle
    }
}


