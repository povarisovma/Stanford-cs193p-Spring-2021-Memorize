//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Максим Поварисов on 09.07.2021.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    static var themes = [
        Theme(name: "vehicles", count: 6, color: Color.blue, emojis: ["🚲", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "🚀", "🚌", "🏍", "🛺", "🛵", "🚗", "🚚", "🛻"]),
        Theme(name: "flags", count: 5, color: Color.black, emojis: ["🇷🇺", "🇷🇴", "🇵🇦", "🇵🇼", "🇰🇾", "🇳🇴", "🇲🇲", "🇲🇽", "🇲🇬", "🇱🇮", "🇱🇹", "🇱🇷", "🇰🇼"]),
        Theme(name: "greetingcards", count: 4, color: Color.green, emojis: ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙"])
    ]
    
    private var theme: Theme
    @Published private var model: MemoryGame<String>
    
    static func createMemoryGame(currentTheme: Theme) -> MemoryGame<String> {
        let shuffledEmojis = currentTheme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: currentTheme.count) { pairIndex in
            shuffledEmojis[pairIndex]
        }
    }
    
    init() {
        theme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
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
    
    var score: String {
        "Score: \(model.score)"
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newgame(){
        theme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        model = EmojiMemoryGame.createMemoryGame(currentTheme: theme)
    }
}


struct Theme{
    let name: String
    let count: Int
    let color: Color
    let emojis: [String]
}
