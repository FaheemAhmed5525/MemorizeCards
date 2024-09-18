//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    var MemorizeViewModel: EmojiMemorize = EmojiMemorize()

    
    var body: some View {
        ScrollView {
            Card
        }
        .padding()
    }
    
    var Card: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(MemorizeViewModel.cards.indices, id: \.self) { index in
                CardView(MemorizeViewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
                Text(card.content).font(.largeTitle)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}



#Preview {
    EmojiMemorizeGameView()
}
