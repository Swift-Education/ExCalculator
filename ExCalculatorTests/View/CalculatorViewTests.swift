//
//  CalculatorViewTests.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import XCTest
import ObjectiveC.runtime
@testable import ExCalculator

 /// UI구성테스트, 뷰로직 테스트, 이벤트 전달 테스트
class CalculatorViewTests: XCTestCase {
    var sut: CalculatorView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorView()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    /// UI구성테스트
    func test_UI구성테스트_연산시작_전_0으로_초기화되어있는지() {
        XCTAssertEqual(sut.resultLabel.text, "0")
    }
    
    /// 뷰로직 테스트
    func test_뷰로직_SetResultLabel_updatesLabelText() {
        sut.setResultLabel(to: "42")
        wait(for: [.delay], timeout: 0.5)
        XCTAssertEqual(sut.resultLabel.text, "42", "Result label should display the updated text.")
    }
    
    /// 이벤트 전달 테스트
    func test_이벤트_전달_테스트_KeypadButtonTapped_sendsEventToDelegate() {
        let keypadView = KeypadView(titles: [["1"]])
        let mockDelegate = MockKeypadViewDelegate()
        keypadView.delegate = mockDelegate
        
        keypadView.delegate?.tappedKeyPadButton(with: "1")
        XCTAssertEqual(mockDelegate.receivedButtonTitle, "1", "Delegate should receive the correct button title.")
    }

    
    /// 굳이 private에 접근하고 싶은 미친 생각이 들때
    func testAccessPrivatePropertyUsingRuntime() {
        // 클래스 타입 가져오기
        let classType = type(of: sut!)
        
        // Objective-C 런타임을 사용해 인스턴스 변수 목록 가져오기
        var count: UInt32 = 0
        guard let ivars = class_copyIvarList(classType, &count) else {
            XCTFail("Failed to retrieve ivar list.")
            return
        }
        
        defer { free(ivars) } // 메모리 해제
        
        // 모든 인스턴스 변수 탐색
        for i in 0..<Int(count) {
            let ivar = ivars[i]
            if let name = ivar_getName(ivar), let propertyName = String(utf8String: name) {
                print("Found ivar: \(propertyName)")
                
                if propertyName == "resultLabel" {
                    // resultLabel 찾기
                    if let resultLabel = object_getIvar(sut!, ivar) as? UILabel {
                        XCTAssertEqual(resultLabel.text, "0", "Result label should initially display '0'")
                    } else {
                        XCTFail("Failed to cast resultLabel as UILabel.")
                    }
                    return
                }
            }
        }
        
        XCTFail("resultLabel ivar not found.")
    }
}

extension XCTestExpectation {
    static var delay: XCTestExpectation {
        let delay = XCTestExpectation()
        delay.isInverted = true
        return delay
    }
}
