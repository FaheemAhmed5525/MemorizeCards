//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var MemorizeViewModel: EmojiMemorize

    
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
    
    var Card: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0){
            ForEach(MemorizeViewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        MemorizeViewModel.chooseCard(card)
                    }
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
    }
}



#Preview {
    EmojiMemorizeGameView(MemorizeViewModel: EmojiMemorize())
}
