//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorize()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(MemorizeViewModel: game)
        }
    }
}
