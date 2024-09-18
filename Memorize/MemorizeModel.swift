//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 17/09/2024.
//

import Foundation

struct MemorizeModel<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // adding double of numOfPairsOfCards
        for pairIndex in 0..<max(2, numOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func chooseCard(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
}
