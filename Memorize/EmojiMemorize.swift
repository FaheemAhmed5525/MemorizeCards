//
//  EmojiMemorize.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 17/09/2024.
//

import SwiftUI



class EmojiMemorize: ObservableObject {
    
    private static let emojis = ["🔺", "🔻", "🔸", "🔹", "🔶", "🔷", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"]
    
    private static func createMemoryGame() -> MemorizeModel<String> {
        return MemorizeModel(numOfPairsOfCards: 2) { index in
            if emojis.indices.contains(index) {
                return emojis[index] //Same As EmojiMemorize.emojis[index] because global emojis is right there
            } else {
                return "<!>"
            }
            
        }
    }
    
    
    
    @Published private var model = EmojiMemorize.createMemoryGame()
    
    var cards: Array<MemorizeModel<String>.Card> {
        model.cards
    }
    
    var color: Color {
        .yellow
    }
    
    //MARK: - Intents
    
    func shuffle() {
        
        model.shuffle()
        objectWillChange.send()
        
    }
    
    func chooseCard( _ card: MemorizeModel<String>.Card) {
        model.chooseCard(card)
    }
}

