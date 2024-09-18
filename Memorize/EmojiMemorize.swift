//
//  EmojiMemorize.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 17/09/2024.
//

import SwiftUI



class EmojiMemorize {
    
    private static let emojis = ["🔺", "🔻", "🔸", "🔹", "🔶", "🔷", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"]
    
    private static func createMemoryGame() -> MemorizeModel<String> {
        return MemorizeModel(numOfPairsOfCards: 16) { index in
            if emojis.indices.contains(index) {
                return emojis[index] //Same As EmojiMemorize.emojis[index] because global emojis is right there
            } else {
                return "<!>"
            }
            
        }
    }
    
    private var model = EmojiMemorize.createMemoryGame()
    
    var cards: Array<MemorizeModel<String>.Card> {
        return model.cards
    }
    
    func chooseCard( _ card: MemorizeModel<String>.Card) {
        model.chooseCard(card)
    }
}

