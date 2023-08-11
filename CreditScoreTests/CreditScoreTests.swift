//
//  CreditScoreTests.swift
//  CreditScoreTests
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import XCTest
import Combine
@testable import CreditScore

final class CreditScoreTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()
    private var viewModel = CreditReportViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CreditReportViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinScoreValueIs0() {
        let expectation = XCTestExpectation(description: "Returns minScoreValue of 0.")

        viewModel.$minScoreValue
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected minScoreValue to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testMaxScoreValueIs700() {
        let expectation = XCTestExpectation(description: "Returns maxScoreValue of 700.")

        viewModel.$maxScoreValue
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, 700,
                               "Expected maxScoreValue to be 700, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testBandDescriptionIsEmpty() {
        let expectation = XCTestExpectation(description: "Returns Excellent for bandDescription.")

        viewModel.$bandDescription
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, "Excellent",
                               "Expected bandDescription to be Excellent, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testCreditScoreIs514() {
        let expectation = XCTestExpectation(description: "Returns credit score of 514.")

        viewModel.$score
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, 514,
                               "Expected score to be 514, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testChangedScoreIs0() {
        let expectation = XCTestExpectation(description: "Returns changedScore of 0.")

        viewModel.$changedScore
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected changedScore to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testShouldShowRingIsTrue() {
        let expectation = XCTestExpectation(description: "Returns true for shouldShowRing.")

        viewModel.$shouldShowRing
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertTrue($0,
                               "Expected shouldShowRing to be true, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testShouldShowChangeIndicatorIsTrue() {
        let expectation = XCTestExpectation(description: "Returns true for shouldShowChangeIndicator.")

        viewModel.$shouldShowChangeIndicator
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertFalse($0,
                               "Expected shouldShowChangeIndicator to be false, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testBaseUrlIsCorrect() {
        XCTAssertEqual(APIManager.baseUrl, "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values",
                       "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values, but got \(APIManager.baseUrl).")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
