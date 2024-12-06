//
//  CalculatorControllerTests.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import XCTest
@testable import ExCalculator

/// 컨트롤러는 모델과 뷰 간의 상호작용을 확인하는 테스트를 진행
final class CalculatorControllerTests: XCTestCase {
    var sut: CalculatorViewController!
    var mockModel: CalculatorModel!
    var mockView: MockCalculatorView!
    
    override func setUpWithError() throws {
        mockModel = CalculatorModel()
        mockView = MockCalculatorViewImpl(keypadView: MockKeypadViewImpl())
        sut = CalculatorViewController(
            model: mockModel,
            view: mockView
        )
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testBind_updatesViewWhenModelChanges() {
        // given
        sut.loadView()
        sut.viewDidLoad()
        mockView.tappedKeypad(with: "42")
        wait(for: [.delay], timeout: 0.5)
        XCTAssertEqual(mockView.receivedResult, "42", "View should display updated result from model.")
    }
    
    func testKeypadButtonEvent_passesToModel() {
        // given
        let mockDelegate = MockKeypadViewDelegate()
        mockView.setDelegate(mockDelegate)
        
        // when
        mockView.tappedKeypad(with: "1")
        
        // then
        XCTAssertEqual(mockDelegate.receivedButtonTitle, "1", "Model should receive input from keypad button.")
    }
}
