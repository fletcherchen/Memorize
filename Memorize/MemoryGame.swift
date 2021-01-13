//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 10/09/2020.
//  Copyright © 2020 Jeng-Wei Chen. All rights reserved.
//

import Foundation
//Model
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
            
//            return cards.indices.filter { (index) -> Bool in cards[index].isFaceUp }.only
            cards.indices.filter {cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let contentOfCard = cardContentFactory(pairIndex)
            cards.append(Card(content: contentOfCard, id: pairIndex*2))
            cards.append(Card(content: contentOfCard, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
