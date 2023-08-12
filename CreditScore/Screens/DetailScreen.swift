//
//  DetailScreen.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/12.
//

import SwiftUI

struct DetailScreen: View {

    private var viewModel: CreditReportViewModel
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    init(viewModel: CreditReportViewModel) {
        self.viewModel = viewModel
    }

    private var background: some View {
        Color.black.opacity(0.85)
    }

    private let animation = Animation
        .easeInOut(duration: 1.5)

    private var heading: some View {
        Text("Credit Score")
            .modifier(PrimaryFont(
                size: 24,
                color: .white,
                weight: .light))
    }

    private var scoreInformation: some View {
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
    }

    private var bandDescription: some View {
        HStack {
            VStack {
                Text("Score band:")
                    .modifier(PrimaryFont(
                        size: 16,
                        color: .white,
                        weight: .light))
                Text("\(viewModel.bandDescription)")
                    .modifier(PrimaryFont(
                        size: 32,
                        color: .white,
                        weight: .medium))
            }
            InfomationIndicator(
                heading: "",
                progress: viewModel.scoreBandPercentage)
                .frame(height: 90)

        }
    }

    private var shortTermDebt: some View {
        VStack {
            Text("Short term debt:")
                .modifier(PrimaryFont(
                    size: 16,
                    color: .white,
                    weight: .light))
            Text("R\(viewModel.currentShortTermDebt)")
                .modifier(PrimaryFont(
                    size: 32,
                    color: .white,
                    weight: .medium))
        }
    }

    private var longTermDebt: some View {
        VStack {
            Text("Long term debt:")
                .modifier(PrimaryFont(
                    size: 16,
                    color: .white,
                    weight: .light))
            Text("R\(viewModel.currentLongTermDebt)")
                .modifier(PrimaryFont(
                    size: 32,
                    color: .white,
                    weight: .medium))
        }
    }

    private var infoIndicators: some View {
        HStack {
            InfomationIndicator(
                heading: "Short Term Credit Usage",
                progress: viewModel.currentShortTermCreditFactor)
            InfomationIndicator(
                heading: "Long Term Credit Usage",
                progress: viewModel.currentLongTermCreditFactor)
        }
    }

    private var information: some View {
        VStack(spacing: 20) {
            heading
            scoreInformation
            bandDescription.padding(.vertical, 20)
            infoIndicators.padding(.vertical)
            shortTermDebt
            longTermDebt
            VStack {
                Text("Days Until Next Report:")
                    .modifier(PrimaryFont(
                        size: 16,
                        color: .white,
                        weight: .light))
                Text("\(viewModel.daysUntilNextReport)")
                    .modifier(PrimaryFont(
                        size: 32,
                        color: .white,
                        weight: .semibold))
            }
            .padding(.top, 10)
        }
    }

    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.backward")
                .foregroundColor(colorScheme == .light ? .indigo : .yellow)
        })
    }

    @ToolbarContentBuilder
    private func toolbar() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(alignment: .center) {
                Text("Credit Report")
                    .modifier(PrimaryFont(
                        size: 16,
                        color: colorScheme == .light ? .indigo : .yellow,
                        weight: .bold))
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                background
                ScrollView(showsIndicators: false) {
                    information.padding(.top, 25)
                }
            }
            .toolbar(content: toolbar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: backButton)
            .animation(animation, value: 1.0)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(viewModel: CreditReportViewModel())
    }
}
