//
//  ReportResponse.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Foundation

struct ReportResponse: Codable {
    let accountIDVStatus: String
    let creditReportInfo: ReportInfo
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
        self.creditReportInfo = try container.decode(ReportInfo.self, forKey: .creditReportInfo)
        self.dashboardStatus = try container.decodeIfPresent(String.self, forKey: .dashboardStatus) ?? ""
        self.personaType = try container.decodeIfPresent(String.self, forKey: .personaType) ?? ""
        self.coachingSummary = try container.decode(CoachingSummary.self, forKey: .coachingSummary)
        self.augmentedCreditScore = try container.decodeIfPresent(String.self, forKey: .augmentedCreditScore) ?? ""
    }

    init(accountIDVStatus: String,
         creditReportInfo: ReportInfo,
         dashboardStatus: String,
         personaType: String,
         coachingSummary: CoachingSummary,
         augmentedCreditScore: String) {
        self.accountIDVStatus = accountIDVStatus
        self.creditReportInfo = creditReportInfo
        self.dashboardStatus = dashboardStatus
        self.personaType = personaType
        self.coachingSummary = coachingSummary
        self.augmentedCreditScore = augmentedCreditScore
    }
}
