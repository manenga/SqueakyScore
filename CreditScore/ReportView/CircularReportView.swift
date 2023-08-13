//
//  CircularReportView.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

struct CircularReportView: View {

    @StateObject var viewModel: CreditReportViewModel
    @State var shouldShowRing = false

    private var background: some View {
        Color.black.opacity(0.85)
            .clipShape(Circle())
            .padding(25)
    }

    private var information: some View {
        VStack(spacing: 14) {
            Text("credit_score")
                .modifier(PrimaryFont(
                    size: 24,
                    color: .white,
                    weight: .semibold))
            HStack {
                Text("\(viewModel.score)")
                    .modifier(PrimaryFont(
                        size: 48,
                        color: .yellow,
                        weight: .bold))
                VStack(alignment: .leading, spacing: 5) {
                    if viewModel.shouldShowChangeIndicator {
                        HStack {
                            Image(systemName: "arrow.down.right")
                                .modifier(PrimaryFont(
                                    size: 18,
                                    color: .purple,
                                    weight: .light))
                            Text("\(viewModel.changedScore)")
                                .modifier(PrimaryFont(
                                    size: 16,
                                    color: .purple,
                                    weight: .bold))
                        }
                    }
                    Text("out of \(viewModel.maxScoreValue)")
                        .modifier(PrimaryFont(
                            size: 14,
                            color: .white,
                            weight: .light))
                }
            }
            Text(viewModel.bandDescription)
                .modifier(PrimaryFont(
                    size: 16,
                    color: .white,
                    weight: .medium))
        }
    }

    var body: some View {
        ZStack {
            background
            information
            if viewModel.shouldShowRing {
                AnimatedRing(
                    progress: viewModel.progress,
                    padding: 40)
            } else {
                AnimatedRing(
                    progress: viewModel.progress,
                    shouldShowRing: false,
                    padding: 40)
            }
        }
    }
}

struct CircularInfoTilePreviews: PreviewProvider {
    static var previews: some View {
        CircularReportView(viewModel: CreditReportViewModel())
    }
}
