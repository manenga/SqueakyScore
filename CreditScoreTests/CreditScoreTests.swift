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
    private var mockViewModel = CreditReportViewModel(apiManager: MockAPIManager())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CreditReportViewModel()
        mockViewModel = CreditReportViewModel(apiManager: MockAPIManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinScoreValueIsCorrect() {
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

    func testProgressValueIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns progress of 0.")
        viewModel.$progress
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, 0.7342857142857143,
                               "Expected progress to be 0, but got \($0).")
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
            .dropFirst()
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
            .dropFirst()
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

    func testCreditScoreIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns correct credit score.")
        viewModel.$score
            .dropFirst()
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

    func testChangedScoreIsCorrect() {
        let expectation = XCTestExpectation(description: "Returns changedScore of 0.")
        viewModel.$changedScore
            .dropFirst()
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

    func testShouldShowRingIsCorrect() {
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
            .dropFirst()
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
