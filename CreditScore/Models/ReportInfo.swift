//
//  ReportInfo.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Foundation

struct ReportInfo: Codable {
    let score, scoreBand: Int
    let clientRef, status: String
    let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
    let hasEverDefaulted: Bool
    let monthsSinceLastDelinquent: Int
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
    let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
    let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
    let currentLongTermCreditLimit, currentLongTermCreditUtilisation: String
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
        self.score = try container.decode(Int.self, forKey: .score)
        self.scoreBand = try container.decode(Int.self, forKey: .scoreBand)
        self.clientRef = try container.decode(String.self, forKey: .clientRef)
        self.status = try container.decode(String.self, forKey: .status)
        self.maxScoreValue = try container.decode(Int.self, forKey: .maxScoreValue)
        self.minScoreValue = try container.decode(Int.self, forKey: .minScoreValue)
        self.monthsSinceLastDefaulted = try container.decode(Int.self, forKey: .monthsSinceLastDefaulted)
        self.hasEverDefaulted = try container.decode(Bool.self, forKey: .hasEverDefaulted)
        self.monthsSinceLastDelinquent = try container.decode(Int.self, forKey: .monthsSinceLastDelinquent)
        self.hasEverBeenDelinquent = try container.decode(Bool.self, forKey: .hasEverBeenDelinquent)
        self.percentageCreditUsed = try container.decode(Int.self, forKey: .percentageCreditUsed)
        self.percentageCreditUsedDirectionFlag = try container.decode(Int.self, forKey: .percentageCreditUsedDirectionFlag)
        self.changedScore = try container.decode(Int.self, forKey: .changedScore)
        self.currentShortTermDebt = try container.decode(Int.self, forKey: .currentShortTermDebt)
        self.currentShortTermNonPromotionalDebt = try container.decode(Int.self, forKey: .currentShortTermNonPromotionalDebt)
        self.currentShortTermCreditLimit = try container.decode(Int.self, forKey: .currentShortTermCreditLimit)
        self.currentShortTermCreditUtilisation = try container.decode(Int.self, forKey: .currentShortTermCreditUtilisation)
        self.changeInShortTermDebt = try container.decode(Int.self, forKey: .changeInShortTermDebt)
        self.currentLongTermDebt = try container.decode(Int.self, forKey: .currentLongTermDebt)
        self.currentLongTermNonPromotionalDebt = try container.decode(Int.self, forKey: .currentLongTermNonPromotionalDebt)
        self.currentLongTermCreditLimit = try container.decodeIfPresent(String.self, forKey: .currentLongTermCreditLimit) ?? ""
        self.currentLongTermCreditUtilisation = try container.decodeIfPresent(String.self, forKey: .currentLongTermCreditUtilisation) ?? ""
        self.changeInLongTermDebt = try container.decode(Int.self, forKey: .changeInLongTermDebt)
        self.numPositiveScoreFactors = try container.decode(Int.self, forKey: .numPositiveScoreFactors)
        self.numNegativeScoreFactors = try container.decode(Int.self, forKey: .numNegativeScoreFactors)
        self.equifaxScoreBand = try container.decode(Int.self, forKey: .equifaxScoreBand)
        self.equifaxScoreBandDescription = try container.decode(String.self, forKey: .equifaxScoreBandDescription)
        self.daysUntilNextReport = try container.decode(Int.self, forKey: .daysUntilNextReport)
    }
}
