//
//  ContentView.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    let symbols = ["🔺", "🔻", "🔸", "🔹", "🔶", "🔷", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"]
    
    var body: some View {
        ScrollView {
            Card
        }
        .padding()
    }
    
    var Card: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(symbols.indices, id: \.self) { index in
                CardView(content: symbols[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.purple)
    }
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.blue)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
