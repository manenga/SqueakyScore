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
    private var apiManager = APIManager()
    private var mockAPIManager = MockAPIManager()
    private var viewModel = CreditReportViewModel()
    private var mockViewModel = CreditReportViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CreditReportViewModel(apiManager: apiManager)
        mockViewModel = CreditReportViewModel(apiManager: mockAPIManager)
    }

    func testMinScoreValueIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns minScoreValue of 0.")
        viewModel.$minScoreValue
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected minScoreValue to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testMinScoreValueIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns minScoreValue of 0.")
        mockViewModel.$progress
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected minScoreValue to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testProgressValueIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns progress of 0.")
        mockViewModel.$progress
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected progress to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testMaxScoreValueIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns correct maxScoreValue.")
        viewModel.$maxScoreValue
            .sink(receiveValue: {
                XCTAssertEqual($0, 700,
                               "Expected maxScoreValue to be 700, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testBandDescriptionIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns correct bandDescription.")
        viewModel.$bandDescription
            .sink(receiveValue: {
                XCTAssertEqual($0, "Excellent",
                               "Expected bandDescription to be Excellent, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testBandDescriptionIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns correct bandDescription.")
        mockViewModel.$bandDescription
            .sink(receiveValue: {
                XCTAssertEqual($0, "Excellent",
                               "Expected bandDescription to be empty, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testScoreBandPercentageIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns correct scoreBandPercentage.")
        mockViewModel.$scoreBandPercentage
            .sink(receiveValue: {
                XCTAssertEqual($0, .zero,
                               "Expected scoreBandPercentage to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }
    
    func testCreditScoreIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns correct credit score.")
        viewModel.$score
            .sink(receiveValue: {
                XCTAssertEqual($0, 514,
                               "Expected score to be 514, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }

    func testCreditScoreIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns correct credit score.")
        mockViewModel.$score
            .sink(receiveValue: {
                XCTAssertEqual($0, UserDefaults.standard.integer(forKey: "Score"),
                               "Expected score to be \(UserDefaults.standard.integer(forKey: "Score")), but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }

    func testDaysUntilNextReportIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns correct days until next report.")
        mockViewModel.$daysUntilNextReport
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected days until next report to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }
    
    func testChangedScoreIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns changedScore of 0.")
        viewModel.$changedScore
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected changedScore to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }

    func testChangedScoreIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns changedScore of 0.")
        mockViewModel.$changedScore
            .sink(receiveValue: {
                XCTAssertEqual($0, 0,
                               "Expected changedScore to be 0, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }

    func testShouldShowRingIsCorrectWithMock() {
        let expectation = XCTestExpectation(description: "Returns true for shouldShowRing.")
        mockViewModel.$shouldShowRing
            .sink(receiveValue: {
                XCTAssertFalse($0,
                               "Expected shouldShowRing to be false, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testShouldShowChangeIndicatorIsFalse() {
        let expectation = XCTestExpectation(description: "Returns true for shouldShowChangeIndicator.")

        viewModel.$shouldShowChangeIndicator
            .sink(receiveValue: {
                XCTAssertFalse($0,
                               "Expected shouldShowChangeIndicator to be false, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testShouldShowChangeIndicatorIsFalseWithMock() {
        let expectation = XCTestExpectation(description: "Returns true for shouldShowChangeIndicator.")

        mockViewModel.$shouldShowChangeIndicator
            .sink(receiveValue: {
                XCTAssertFalse($0,
                               "Expected shouldShowChangeIndicator to be false, but got \($0).")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 2)
    }

    func testBaseURLShouldBeCorrect() {
        XCTAssertEqual(apiManager.baseUrl,
                       "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values",
                       "Expected baseUrl to be correct, but got \(apiManager.baseUrl).")
    }

    func testBaseURLShouldBeCorrectWithMock() {
        XCTAssertEqual(mockAPIManager.baseUrl,
                       "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values",
                       "Expected baseUrl to be correct, but got \(mockAPIManager.baseUrl).")
    }
}
