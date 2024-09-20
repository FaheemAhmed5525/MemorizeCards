//
//  CardView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 20/09/2024.
//

import SwiftUI

struct CardView: View {
    
    let card: MemorizeModel<String>.Card
    
    init(_ card: MemorizeModel<String>.Card) {
        self.card = card
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let insets: CGFloat = 5
        
        struct FontSzie {
            static let largest: CGFloat = 220
            static let smallest: CGFloat = 12
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.6
            static let insets: CGFloat = 5
        }
    }
    
    var body: some View {
        Pie(startAngle: .degrees(225), endAngle: .degrees(315), clockwise: false)
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSzie.largest))
                    .minimumScaleFactor(Constants.FontSzie.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.insets)
            )
            .padding(Constants.insets)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp ? 1 : 0)
    }
}


#Preview {
    VStack {
        HStack {
            CardView(MemorizeModel<String>.Card(content: "X", id: "Preview1"))
            CardView(MemorizeModel<String>.Card(isFaceUp: true, content: "X", id: "Preview1"))
        }
        HStack {
            CardView(MemorizeModel<String>.Card(isFaceUp: true, content: "X", id: "Preview1"))
            CardView(MemorizeModel<String>.Card(content: "X", id: "Preview1"))
        }
    }
        .padding()
        .foregroundColor(.green)
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
