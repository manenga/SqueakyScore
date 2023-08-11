//
//  CreditReportView.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

struct CreditReportView: View {

    @ObservedObject var viewModel: CreditReportViewModel
    @State private var drawingStroke = false

    private var background: some View {
        Color.black.opacity(0.85)
            .clipShape(Circle())
            .padding(25)
    }

    private let animation = Animation
        .easeInOut(duration: 1.5)

    private var information: some View {
        VStack(spacing: 14) {
            Text("Credit Score")
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

    private var ring: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 3))
            .foregroundStyle(Color.indigo.opacity(0.25))
            .overlay {
                if viewModel.shouldShowRing {
                    Circle()
                        .trim(from: 0, to: drawingStroke ? viewModel.progress : 0)
                        .stroke(.white,
                                style: StrokeStyle(
                                    lineWidth: 3,
                                    lineCap: .round))
                        .onAppear {
                            drawingStroke.toggle()
                        }
                }
            }
            .rotationEffect(.degrees(-90)).padding(40)

    }

    var body: some View {
        ZStack {
            background
            information
            ring
        }
        .animation(animation, value: drawingStroke)
    }
}

struct CircularInfoTilePreviews: PreviewProvider {
    static var previews: some View {
        CreditReportView(viewModel: CreditReportViewModel())
    }
}
