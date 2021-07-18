//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Максим Поварисов on 09.07.2021.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    public var scoreInt: Int
    @Published public var scoreText: String
    
    static var themes = [
        Theme(name: "vehicles", count: 6, color: Color.blue, emojis: ["🚲", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "🚀", "🚌", "🏍", "🛺", "🛵", "🚗", "🚚", "🛻"]),
        Theme(name: "flags", count: 5, color: Color.black, emojis: ["🇷🇺", "🇷🇴", "🇵🇦", "🇵🇼", "🇰🇾", "🇳🇴", "🇲🇲", "🇲🇽", "🇲🇬", "🇱🇮", "🇱🇹", "🇱🇷", "🇰🇼"]),
        Theme(name: "greetingcards", count: 4, color: Color.green, emojis: ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙"])
    ]
    private var theme = themes[Int.random(in: 0..<themes.count)]

    @Published private var model: MemoryGame<String>
    
    static func createMemoryGame(currentTheme: Theme) -> MemoryGame<String> {
        let shuffledEmojis = currentTheme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: currentTheme.count) { pairIndex in
            shuffledEmojis[pairIndex]
        }
    }
    
    init() {
        scoreInt = 0
        scoreText = "Score: \(scoreInt)"
        model = EmojiMemoryGame.createMemoryGame(currentTheme: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        return theme.color
    }
    
    var title: String {
        theme.name
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newgame(){
        scoreInt += 1
        scoreText = "Score: \(scoreInt)"
    }
}


struct Theme{
    let name: String
    let count: Int
    let color: Color
    let emojis: [String]
}
