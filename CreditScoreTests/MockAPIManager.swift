//
//  MockAPIManager.swift
//  CreditScoreTests
//
//  Created by Manenga Mungandi on 2023/08/12.
//

import Combine
import Foundation
@testable import CreditScore

class MockAPIManager: APIManagerType {
    let apiClient = APIClient()
    let baseUrl: String = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
}

extension MockAPIManager {
    func request() -> AnyPublisher<ReportResponse?, Error> {
        return Just(nil)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
