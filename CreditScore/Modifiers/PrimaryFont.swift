//
//  PrimaryFont.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import SwiftUI

struct PrimaryFont: ViewModifier {
    var size: CGFloat = 16
    var color: Color = .black
    var weight: Font.Weight
    var alignment: TextAlignment = .leading
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .multilineTextAlignment(alignment)
            .font(.system(size: size, weight: weight))
    }
}

struct PrimaryFontPreviews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .modifier(PrimaryFont(weight: .bold))
    }
}
