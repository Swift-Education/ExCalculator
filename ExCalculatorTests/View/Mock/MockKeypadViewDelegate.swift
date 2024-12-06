//
//  MockKeypadViewDelegate.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import Foundation
@testable import ExCalculator

// Mock Delegate
final class MockKeypadViewDelegate: KeypadViewDelegate {
    var receivedButtonTitle: String?

    func tappedKeyPadButton(with titleNumber: String) {
        receivedButtonTitle = titleNumber
    }
}
