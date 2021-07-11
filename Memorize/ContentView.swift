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
//    @State var currentArray :[String] = []
//    @State var currentCountCards = 0
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
//        VStack {
//            Text("Memorize!").font(.largeTitle).foregroundColor(.black)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
//                    ForEach(currentArray[0..<currentCountCards], id: \.self) { card in
//                        CardView(content: card).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                    }
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
    
//    var vehiclesAdd: some View {
//        Button {
//            currentArray = vehicles.shuffled()
//            currentCountCards = vehicles.count
//        } label: {
//            VStack {
//                Image(systemName: "car").font(.largeTitle)
//                Text("Vehicles").font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
//            }
//        }
//    }
//
//    var flagsAdd: some View {
//        Button {
//            currentArray = flags.shuffled()
//            currentCountCards = flags.count
//        } label: {
//            VStack {
//                Image(systemName: "flag").font(.largeTitle)
//                Text("Flags").font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
//            }
//        }
//    }
//
//    var greetingcardsAdd: some View {
//        Button {
//            currentArray = greetingcards.shuffled()
//            currentCountCards = greetingcards.count
//        } label: {
//            VStack {
//                Image(systemName: "greetingcard").font(.largeTitle)
//                Text("Greetingcard").font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
//            }
//        }
//    }
}


struct CardView: View {
//    var content: String
//    @State var isFaceUp: Bool = true
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
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
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
