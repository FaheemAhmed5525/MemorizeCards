//
//  Pie.swift
//  Memorize
//
//  Created by Faheeam Ahmed on 20/09/2024.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = .zero
    var endAngle: Angle = .degrees(90)
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc (
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        
        path.addLine(to: center)
        
        return path
    }
}

#Preview {
    Pie()
}
