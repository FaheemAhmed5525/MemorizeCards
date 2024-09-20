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
        .foregroundColor(MemorizeViewModel.color)
    }
}





#Preview {
    EmojiMemorizeGameView(MemorizeViewModel: EmojiMemorize())
}
