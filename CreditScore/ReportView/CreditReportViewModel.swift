//
//  CreditReportViewModel.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Combine
import Foundation

class CreditReportViewModel: ObservableObject {

    private var cancellableToken: AnyCancellable?
    private var apiManager: APIManagerType

    private var creditReportResponse: ReportResponse? {
        didSet {
            guard let response = creditReportResponse else { return }
            score = response.creditReportInfo.score
            changedScore = response.creditReportInfo.changedScore
            minScoreValue = response.creditReportInfo.minScoreValue
            maxScoreValue = response.creditReportInfo.maxScoreValue
            bandDescription = response.creditReportInfo.equifaxScoreBandDescription

            UserDefaults.standard.set(score, forKey: "Score")
            UserDefaults.standard.set(minScoreValue, forKey: "MinScore")
            UserDefaults.standard.set(maxScoreValue, forKey: "MaxScore")
            UserDefaults.standard.set(bandDescription, forKey: "BandDescription")
            UserDefaults.standard.synchronize()
        }
    }

    @Published var score: Int = UserDefaults.standard.integer(forKey: "Score")
    @Published var minScoreValue: Int = UserDefaults.standard.integer(forKey: "MinScore")
    @Published var bandDescription: String = UserDefaults.standard.string(forKey: "BandDescription") ?? ""
    @Published var shouldShowChangeIndicator: Bool = false
    @Published var shouldShowRing: Bool = false

    @Published var progress: Double = .zero {
        didSet {
            shouldShowRing = progress > .zero
        }
    }

    @Published var changedScore: Int = .zero {
        didSet {
            shouldShowChangeIndicator = changedScore != .zero
        }
    }

    @Published var maxScoreValue: Int = UserDefaults.standard.integer(forKey: "MaxScore") {
        didSet {
            guard maxScoreValue > .zero && maxScoreValue > score else { return }
            progress = Double(score) / Double(maxScoreValue)
        }
    }

    init(apiManager: APIManagerType = APIManager()) {
        self.apiManager = apiManager
        refreshCreditReport()
    }

    private func refreshCreditReport() {
        cancellableToken = apiManager.request()
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] response in
                self?.creditReportResponse = response
            })
    }
}
