//
//  InfoIndicator.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/12.
//

import SwiftUI

struct InfoIndicator: View {

    var heading: String = ""
    @State var progress: Double

    var body: some View {
        VStack(spacing: 5) {
            if !heading.isEmpty {
                Text(heading)
                    .modifier(PrimaryFont(
                        size: 16,
                        color: .white,
                        weight: .light,
                        alignment: .center))
            }
            ZStack {
                AnimatedRing(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")")
                    .modifier(PrimaryFont(
                        size: 18,
                        color: .yellow,
                        weight: .bold))
            }
        }
        .frame(maxWidth: 160, maxHeight: 160)
    }
}


struct InfoIndicatorPreviews: PreviewProvider {
    static var previews: some View {
        InfoIndicator(heading: "",
                      progress: 1.0)
        .background(Color.black.opacity(0.85))
    }
}
