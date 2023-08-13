//
//  CreditScoreUITests.swift
//  CreditScoreUITests
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import XCTest
@testable import CreditScore

final class CreditScoreUITests: XCTestCase {

    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testWelcomeNavigationTitle() throws {
        let welcome = app.navigationBars.staticTexts["Welcome"]
        XCTAssert(welcome.exists)

        let name = app.navigationBars.staticTexts["Manenga"]
        XCTAssert(name.exists)
    }

    func testNavigationToDetailScreen() throws {
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element.press(forDuration: 0.8)

        let elementsQuery = app.scrollViews.otherElements

        let creditScore = elementsQuery.staticTexts["Credit Score"]
        XCTAssert(creditScore.exists)
        creditScore.tap()

        let shortTermDebt = elementsQuery.staticTexts["Short Term Debt"]
        XCTAssert(shortTermDebt.exists)

        let longTermDebt = elementsQuery.staticTexts["Long Term Debt"]
        XCTAssert(longTermDebt.exists)

        let shortTermCreditUsage = elementsQuery.staticTexts["Short Term Credit Usage"]
        XCTAssert(shortTermCreditUsage.exists)

        let longTermCreditUsage = elementsQuery.staticTexts["Long Term Credit Usage"]
        XCTAssert(longTermCreditUsage.exists)
    }
}
