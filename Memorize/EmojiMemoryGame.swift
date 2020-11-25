//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 10/09/2020.
//  Copyright © 2020 Jeng-Wei Chen. All rights reserved.
//

import SwiftUI
//ViewModel
class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
//        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: {(pairIndex: Int) -> String in
//            return emojis[pairIndex]
//        })
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    //MARK: -Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: -Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
