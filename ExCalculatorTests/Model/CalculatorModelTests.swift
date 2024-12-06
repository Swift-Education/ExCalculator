//
//  CalculatorModelTests.swift
//  ExCalculatorTests
//
//  Created by 강동영 on 12/6/24.
//

import XCTest
@testable import ExCalculator

final class CalculatorModelTests: XCTestCase {
    // System Under Test라는 의미. 즉, test를 할 타입
    var sut: CalculatorModel!
    
    /// 각각의 test case가 실행되기 전마다 호출되어 각 테스트가 모두 같은 상태와 조건에서 실행될 수 있도록 만들어 줄 수 있는 메서드
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorModel()
    }
    
    /// 각각의 test 실행이 끝난 후마다 호출되는 메서드
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_연산시작_전_0으로_초기화되어있는지() {
        // given
        // when
        // then
        XCTAssertEqual(sut.resultBuffer, "0")
    }
    
    func test_plus_123() {
        sum(with: "1+2+3", expection: "6")
    }
    
    func test_multiply_123_456() {
        sum(with: "123*456", expection: "56088")
    }
    
    func test_calculate_two_expression() {
        sum(with: "1+2+3", expection: "6")
        sum(with: "123*456", expection: "56088")
    }
    
    private func sum(with expression: String, expection: String) {
        // given
        expression
            .map { String($0) }
            .forEach {
                sut.tappedKeyPadButton(with: $0)
            }
        
        // when
        sut.tappedKeyPadButton(with: "=")
        
        // then
        XCTAssertEqual(sut.resultBuffer, expection)
    }
}
