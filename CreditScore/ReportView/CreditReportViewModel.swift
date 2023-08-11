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
    private var creditReportResponse: ReportResponse? {
        didSet {
            guard let response = creditReportResponse else { return }
            score = response.creditReportInfo.score
            changedScore = response.creditReportInfo.changedScore
            minScoreValue = response.creditReportInfo.minScoreValue
            maxScoreValue = response.creditReportInfo.maxScoreValue
            bandDescription = response.creditReportInfo.equifaxScoreBandDescription
        }
    }

    @Published var score: Int = .zero
    @Published var minScoreValue: Int = .zero
    @Published var bandDescription: String = ""
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

    @Published var maxScoreValue: Int = .zero {
        didSet {
            guard maxScoreValue > .zero && maxScoreValue > score else { return }
            progress = Double(score) / Double(maxScoreValue)
        }
    }

    init() {
        cancellableToken = APIManager.request()
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] response in
                self?.creditReportResponse = response
            })
    }
}
