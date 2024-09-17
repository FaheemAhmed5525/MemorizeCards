//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 17/09/2024.
//

import Foundation

struct MemorizeModel<CardContent> {
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
