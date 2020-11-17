//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 10/09/2020.
//  Copyright © 2020 Jeng-Wei Chen. All rights reserved.
//

import Foundation
//Model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
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
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
