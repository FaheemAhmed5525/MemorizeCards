//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 17/09/2024.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // adding double of numOfPairsOfCards
        for pairIndex in 0..<max(2, numOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    mutating func chooseCard(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int{
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 //FIXME: bogus!
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\t\(id): \(content) \(isFaceUp ? "Open" : "Close")"
        }
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched
//            lhs.content == rhs.content
//        }
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
    }
}
