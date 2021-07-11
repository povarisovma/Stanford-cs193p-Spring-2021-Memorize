//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Максим Поварисов on 06.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
