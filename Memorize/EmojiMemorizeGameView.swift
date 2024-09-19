//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var MemorizeViewModel: EmojiMemorize

    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            ScrollView {
                Card
                    .animation(.default, value: MemorizeViewModel.cards)
            }
            Button("Shuffle") {
                MemorizeViewModel.shuffle()
            }
        }
        .padding()
    }
    
    @ViewBuilder var Card: some View {
        AspectVGrid(MemorizeViewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    MemorizeViewModel.chooseCard(card)
            }
        }
        .foregroundColor(.purple)
    }
}


struct CardView: View {
    let card: MemorizeModel<String>.Card
    
    init(_ card: MemorizeModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                VStack {Text(card.content)
                        .font(.system(size: 120))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    Text(card.id)
                        .font(.title)
                }
            }
                .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



#Preview {
    EmojiMemorizeGameView(MemorizeViewModel: EmojiMemorize())
}
