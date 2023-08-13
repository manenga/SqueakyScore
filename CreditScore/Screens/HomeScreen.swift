//
//  HomeScreen.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

struct HomeScreen: View {

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

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
            Text("welcome")
                .modifier(PrimaryFont(
                    size: 16,
                    color: colorScheme == .light ? .black : .white,
                    weight: .light))
            Text("Manenga")
                .modifier(PrimaryFont(
                    size: 16,
                    color: colorScheme == .light ? .indigo : .yellow,
                    weight: .bold))
        }
    }

    private var circularReport: some View {
        ZStack(alignment: .topLeading) {
            backgroundImage
            ScrollView {
                VStack {
                    Spacer(minLength: 120)
                    CircularReportView(viewModel: CreditReportViewModel())
                        .padding(5)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: toolbar)
    }

    var body: some View {
        NavigationView {
            NavigationLink(destination: {
                DetailScreen(viewModel: CreditReportViewModel())
                    .navigationBarBackButtonHidden(true)
            }, label: { circularReport })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
