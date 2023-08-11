//
//  APIManager.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Combine
import Foundation

protocol APIManagerType {
    var apiClient: APIClient { get }
    var baseUrl: String { get }
    func request() -> AnyPublisher<ReportResponse?, Error>
}

class APIManager: APIManagerType {
    let apiClient = APIClient()
    let baseUrl: String = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
}

extension APIManager {
    internal func request() -> AnyPublisher<ReportResponse?, Error> {
        return makeRequest()
    }

    private func makeRequest<T: Decodable>() -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseUrl) else { fatalError("Couldn't resolve URL") }

        let request = URLRequest(url: url)
        return apiClient.run(request)
            .map(\.value)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
