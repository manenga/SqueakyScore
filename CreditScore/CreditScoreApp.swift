//
//  CreditScoreApp.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

@main
struct CreditScoreApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen().environment(\.locale, .init(identifier: "af-ZA"))
        }
    }
}
