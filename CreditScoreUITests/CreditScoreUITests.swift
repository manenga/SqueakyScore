//
//  CreditScoreUITests.swift
//  CreditScoreUITests
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import XCTest

final class CreditScoreUITests: XCTestCase {

    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testWelcomeNavigationTitle() throws {
        let welcome = app.staticTexts["Welcome"]
        XCTAssert(welcome.exists)

        let name = app.staticTexts["Manenga"]
        XCTAssert(name.exists)
    }

    func testCreditScoreTitle() throws {
        let creditScore = app.staticTexts["Credit Score"]
        XCTAssert(creditScore.exists)
    }

    func testCreditScoreValues() throws {
        let creditScore = app.staticTexts["514"]
        XCTAssert(creditScore.exists)

        let maxScore = app.staticTexts["out of 700"]
        XCTAssert(maxScore.exists)

        let bandDescription = app.staticTexts["Excellent"]
        XCTAssert(bandDescription.exists)
    }
}
