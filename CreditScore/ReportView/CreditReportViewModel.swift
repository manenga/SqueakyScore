//
//  CreditReportViewModel.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Combine
import Foundation

class CreditReportViewModel: ObservableObject {

    private var apiManager: APIManagerType
    private var cancellableToken: AnyCancellable?
    private var currentLongTermCreditLimit: Int = .zero
    private var currentShortTermCreditLimit: Int = .zero

    private var scoreBand: Int = UserDefaults.standard.integer(forKey: "ScoreBand") {
        didSet {
            scoreBandPercentage = Double(scoreBand) / 5.0
        }
    }

    private var creditReportResponse: ReportResponse? {
        didSet {
            guard let report = creditReportResponse?.creditReportInfo else { return }
            score = report.score
            changedScore = report.changedScore
            scoreBand = report.equifaxScoreBand
            minScoreValue = report.minScoreValue
            maxScoreValue = report.maxScoreValue
            daysUntilNextReport = report.daysUntilNextReport
            currentLongTermDebt = report.currentLongTermDebt
            currentShortTermDebt = report.currentShortTermDebt
            percentageCreditUsed = report.percentageCreditUsed
            bandDescription = report.equifaxScoreBandDescription
            numNegativeScoreFactors = report.numNegativeScoreFactors
            numPositiveScoreFactors = report.numPositiveScoreFactors
            currentLongTermCreditLimit = report.currentLongTermCreditLimit
            currentShortTermCreditLimit = report.currentShortTermCreditLimit
            currentShortTermCreditUtilisation = report.currentShortTermCreditUtilisation

            UserDefaults.standard.set(score, forKey: "Score")
            UserDefaults.standard.set(minScoreValue, forKey: "MinScore")
            UserDefaults.standard.set(maxScoreValue, forKey: "MaxScore")
            UserDefaults.standard.set(bandDescription, forKey: "BandDescription")
            UserDefaults.standard.synchronize()
        }
    }

    @Published var score: Int = UserDefaults.standard.integer(forKey: "Score")
    @Published var scoreBandPercentage: Double = .zero
    @Published var minScoreValue: Int = UserDefaults.standard.integer(forKey: "MinScore")
    @Published var bandDescription: String = UserDefaults.standard.string(forKey: "BandDescription") ?? ""

    @Published var shouldShowRing: Bool = false
    @Published var daysUntilNextReport: Int = .zero
    @Published var currentLongTermDebt: Int = .zero
    @Published var currentShortTermDebt: Int = .zero
    @Published var percentageCreditUsed: Int = .zero
    @Published var numNegativeScoreFactors: Int = .zero
    @Published var numPositiveScoreFactors: Int = .zero
    @Published var shouldShowChangeIndicator: Bool = false
    @Published var currentLongTermCreditFactor: Double = .zero
    @Published var currentShortTermCreditFactor: Double = .zero

    @Published var currentLongTermCreditUtilisation: Int = .zero {
        didSet {
            guard currentLongTermCreditLimit > .zero else { return }
            currentLongTermCreditFactor = Double(currentLongTermCreditUtilisation) / 100
        }
    }

    @Published var currentShortTermCreditUtilisation: Int = .zero {
        didSet {
            guard currentShortTermCreditLimit > .zero else { return }
            currentShortTermCreditFactor = Double(currentShortTermCreditUtilisation) / 100
        }
    }

    @Published var maxScoreValue: Int = UserDefaults.standard.integer(forKey: "MaxScore") {
        didSet {
            guard maxScoreValue > .zero && maxScoreValue > score else { return }
            progress = Double(score) / Double(maxScoreValue)
        }
    }

    @Published var changedScore: Int = .zero {
        didSet {
            shouldShowChangeIndicator = changedScore != .zero
        }
    }

    @Published var progress: Double = .zero {
        didSet {
            shouldShowRing = progress > .zero
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
