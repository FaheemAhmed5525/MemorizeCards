//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 19/09/2024.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFirts(
                count: items.count,
                size: geometry.size,
                atAspectRadio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)

                }
            }
        }
    }
    
    
    func gridItemWidthThatFirts (
        count: Int,
        size: CGSize,
        atAspectRadio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            print("width: \(width)\theight: \(height)\trowCount: \(rowCount)\ncolumnCount \(columnCount)\tsize.hight: \(size.height)\nsize.width: \(size.width)\tcount: \(count)\n\n")
            columnCount += 1
        } while columnCount < count
        print("\(min(size.width / count, size.height * aspectRatio).rounded(.down))")
        return min(size.width / count, size.height * aspectRatio).rounded(.down) * 20
        
    
    }
}

