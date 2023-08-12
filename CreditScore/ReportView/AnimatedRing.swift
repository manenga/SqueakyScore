//
//  AnimatedRing.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/12.
//

import SwiftUI

struct AnimatedRing: View {

    @State var progress: Double = .zero
    @State var drawingStroke = false
    @State var shouldShowRing = true
    var padding: CGFloat = 10.0

    private let animation = Animation
        .easeInOut(duration: 1.5)

    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 3))
            .foregroundStyle(Color.indigo.opacity(0.25))
            .overlay {
                if shouldShowRing {
                    Circle()
                        .trim(from: 0, to: drawingStroke ? progress : 0)
                        .stroke(.white,
                                style: StrokeStyle(
                                    lineWidth: 3,
                                    lineCap: .round))
                        .onAppear {
                            guard !drawingStroke else { return }
                            drawingStroke.toggle()
                        }
                }
            }
            .rotationEffect(.degrees(-90)).padding(padding)
            .animation(animation, value: drawingStroke)
    }
}

struct AnimatedRingPreviews: PreviewProvider {
    static var previews: some View {
        AnimatedRing(progress: 0.35)
            .background(Color.black.opacity(0.85))
    }
}
