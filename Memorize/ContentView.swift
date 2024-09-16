//
//  ContentView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    let symbols = ["🔺", "🔻", "🔸", "🔹", "🔶", "🔷", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                card
            }
            
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View {
        Button("-") {
            
        }
        Spacer()
        return Button("+") {
            
        }
    }
}



#Preview {
    ContentView()
}
