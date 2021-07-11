//
//  ContentView.swift
//  Memorize
//
//  Created by Максим Поварисов on 06.07.2021.
//

import SwiftUI

struct ContentView: View {
//    @State var vehicles = ["🚲", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "🚀", "🚌", "🏍", "🛺", "🛵", "🚗", "🚚", "🛻"]
//    @State var greetingcards = ["🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🏙"]
//    @State var flags = ["🇷🇺", "🇷🇴", "🇵🇦", "🇵🇼", "🇰🇾", "🇳🇴", "🇲🇲", "🇲🇽", "🇲🇬", "🇱🇮", "🇱🇹", "🇱🇷", "🇰🇼"]
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
