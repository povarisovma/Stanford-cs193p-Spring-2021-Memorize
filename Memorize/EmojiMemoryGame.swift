//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Максим Поварисов on 09.07.2021.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    static let vehicles = ["🚲", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "🚀", "🚌", "🏍", "🛺", "🛵", "🚗", "🚚", "🛻"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            vehicles[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
