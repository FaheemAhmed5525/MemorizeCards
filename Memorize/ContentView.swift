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
    
    var card: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: symbols[index])
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled((cardCount + offset < 1 || cardCount + offset > symbols.count))
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
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
