//
//  ExCalculatorUITests.swift
//  ExCalculatorUITests
//
//  Created by 강동영 on 12/6/24.
//

import XCTest

final class ExCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }

    @MainActor
    func test_버튼테스트() throws {
        let app = XCUIApplication()
        app.launch()
        
        let input = "123456789"
        calcuate(app: app, input: "123456789")
        let resultLabel = app.staticTexts[input]
        
        XCTAssertTrue(resultLabel.exists)
    }
    
    @MainActor
    func test_더하기1_2_3() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        calcuate(app: app, input: "1+2+3=")
        let resultLabel = app.staticTexts["6"]

        XCTAssertTrue(resultLabel.exists)
    }

    @MainActor
    func test_곱하기123_456() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        calcuate(app: app, input: "123*456=")
        let resultLabel = app.staticTexts["56088"]

        XCTAssertTrue(resultLabel.exists)
    }
    
    private func calcuate(app: XCUIApplication, input: String) {
        input
            .map { String($0) }
            .forEach {
                app.buttons[$0].tap()
            }
    }
}
