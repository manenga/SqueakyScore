//
//  CreditReportInfo.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Foundation

struct ReportResponse: Codable {
    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfo
    let dashboardStatus, personaType: String
    let coachingSummary: CoachingSummary
    let augmentedCreditScore: String

    enum CodingKeys: String, CodingKey {
        case accountIDVStatus
        case creditReportInfo
        case dashboardStatus, personaType
        case coachingSummary
        case augmentedCreditScore
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountIDVStatus = try container.decodeIfPresent(String.self, forKey: .accountIDVStatus) ?? ""
        self.creditReportInfo = try container.decode(CreditReportInfo.self, forKey: .creditReportInfo)
        self.dashboardStatus = try container.decodeIfPresent(String.self, forKey: .dashboardStatus) ?? ""
        self.personaType = try container.decodeIfPresent(String.self, forKey: .personaType) ?? ""
        self.coachingSummary = try container.decode(CoachingSummary.self, forKey: .coachingSummary)
        self.augmentedCreditScore = try container.decodeIfPresent(String.self, forKey: .augmentedCreditScore) ?? ""
    }
}

struct CoachingSummary: Codable {
    let activeTodo, activeChat: Bool
    let numberOfTodoItems, numberOfCompletedTodoItems: Int
    let selected: Bool

    enum CodingKeys: String, CodingKey {
        case activeTodo, activeChat
        case numberOfTodoItems, numberOfCompletedTodoItems
        case selected
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activeTodo = try container.decode(Bool.self, forKey: .activeTodo)
        self.activeChat = try container.decode(Bool.self, forKey: .activeChat)
        self.numberOfTodoItems = try container.decode(Int.self, forKey: .numberOfTodoItems)
        self.numberOfCompletedTodoItems = try container.decode(Int.self, forKey: .numberOfCompletedTodoItems)
        self.selected = try container.decode(Bool.self, forKey: .selected)
    }
}

struct CreditReportInfo: Codable {
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
