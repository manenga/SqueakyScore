//
//  CreditReport.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Foundation

struct CreditReport: Codable {
    let score, scoreBand: Int
    let clientRef, status: String
    let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
    let hasEverDefaulted: Bool
    let monthsSinceLastDelinquent: Int
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
    let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
    let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
    let currentLongTermCreditLimit, currentLongTermCreditUtilisation: Int
    let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
    let equifaxScoreBandDescription: String
    let daysUntilNextReport: Int

    enum CodingKeys: String, CodingKey {
        case score, scoreBand, clientRef, status, maxScoreValue, minScoreValue, monthsSinceLastDefaulted
        case hasEverDefaulted, monthsSinceLastDelinquent, hasEverBeenDelinquent
        case percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt
        case currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt
        case currentLongTermDebt, currentLongTermNonPromotionalDebt
        case currentLongTermCreditLimit, currentLongTermCreditUtilisation
        case changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand
        case equifaxScoreBandDescription
        case daysUntilNextReport
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.score = try container.decodeIfPresent(Int.self, forKey: .score) ?? .zero
        self.scoreBand = try container.decodeIfPresent(Int.self, forKey: .scoreBand) ?? .zero
        self.clientRef = try container.decodeIfPresent(String.self, forKey: .clientRef) ?? ""
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.maxScoreValue = try container.decodeIfPresent(Int.self, forKey: .maxScoreValue) ?? .zero
        self.minScoreValue = try container.decodeIfPresent(Int.self, forKey: .minScoreValue) ?? .zero
        self.monthsSinceLastDefaulted = try container.decodeIfPresent(Int.self, forKey: .monthsSinceLastDefaulted) ?? .zero
        self.hasEverDefaulted = try container.decodeIfPresent(Bool.self, forKey: .hasEverDefaulted) ?? false
        self.monthsSinceLastDelinquent = try container.decodeIfPresent(Int.self, forKey: .monthsSinceLastDelinquent) ?? .zero
        self.hasEverBeenDelinquent = try container.decodeIfPresent(Bool.self, forKey: .hasEverBeenDelinquent) ?? false
        self.percentageCreditUsed = try container.decodeIfPresent(Int.self, forKey: .percentageCreditUsed) ?? .zero
        self.percentageCreditUsedDirectionFlag = try container.decodeIfPresent(Int.self, forKey: .percentageCreditUsedDirectionFlag) ?? .zero
        self.changedScore = try container.decodeIfPresent(Int.self, forKey: .changedScore) ?? .zero
        self.currentShortTermDebt = try container.decodeIfPresent(Int.self, forKey: .currentShortTermDebt) ?? .zero
        self.currentShortTermNonPromotionalDebt = try container.decodeIfPresent(Int.self, forKey: .currentShortTermNonPromotionalDebt) ?? .zero
        self.currentShortTermCreditLimit = try container.decodeIfPresent(Int.self, forKey: .currentShortTermCreditLimit) ?? .zero
        self.currentShortTermCreditUtilisation = try container.decodeIfPresent(Int.self, forKey: .currentShortTermCreditUtilisation) ?? .zero
        self.changeInShortTermDebt = try container.decodeIfPresent(Int.self, forKey: .changeInShortTermDebt) ?? .zero
        self.currentLongTermDebt = try container.decodeIfPresent(Int.self, forKey: .currentLongTermDebt) ?? .zero
        self.currentLongTermNonPromotionalDebt = try container.decodeIfPresent(Int.self, forKey: .currentLongTermNonPromotionalDebt) ?? .zero
        self.currentLongTermCreditLimit = try container.decodeIfPresent(Int.self, forKey: .currentLongTermCreditLimit) ?? .zero
        self.currentLongTermCreditUtilisation = try container.decodeIfPresent(Int.self, forKey: .currentLongTermCreditUtilisation) ?? .zero
        self.changeInLongTermDebt = try container.decodeIfPresent(Int.self, forKey: .changeInLongTermDebt) ?? .zero
        self.numPositiveScoreFactors = try container.decodeIfPresent(Int.self, forKey: .numPositiveScoreFactors) ?? .zero
        self.numNegativeScoreFactors = try container.decodeIfPresent(Int.self, forKey: .numNegativeScoreFactors) ?? .zero
        self.equifaxScoreBand = try container.decodeIfPresent(Int.self, forKey: .equifaxScoreBand) ?? .zero
        self.equifaxScoreBandDescription = try container.decodeIfPresent(String.self, forKey: .equifaxScoreBandDescription) ?? ""
        self.daysUntilNextReport = try container.decodeIfPresent(Int.self, forKey: .daysUntilNextReport) ?? .zero
    }
}
