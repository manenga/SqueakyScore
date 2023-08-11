//
//  HomeScreen.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

struct HomeScreen: View {

    private var backgroundImage: some View {
        Image(uiImage: UIImage(named: "mountain")!)
            .resizable()
            .overlay(Color.gray.opacity(0.5))
    }

    @ToolbarContentBuilder
    private func toolbar() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(alignment: .center) {
                nameStack
            }
        }
    }

    private var nameStack: some View {
        VStack(alignment: .center) {
            Text("Welcome")
                .modifier(PrimaryFont(
                    size: 16,
                    color: .black,
                    weight: .light))
            Text("Manenga")
                .modifier(PrimaryFont(
                    size: 16,
                    color: .indigo,
                    weight: .bold))
        }
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                backgroundImage
                ScrollView {
                    VStack {
                        Spacer(minLength: 120)
                        CreditReportView(viewModel: CreditReportViewModel(creditScore: 512))
                            .padding(5)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbar)
        }
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
