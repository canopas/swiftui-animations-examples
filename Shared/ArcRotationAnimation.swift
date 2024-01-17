//
//  ArcRotationAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI

struct ArcRotationAnimation: View {
    
    @State private var isAnimating: Bool = false
    
    @State private var arcAngle1: Double = 0
    @State private var arcAngle2: Double = 180
    @State private var circleHeight: CGFloat = 135
    
    @State var color: Color = .black
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(height: circleHeight)
                
                Circle()
                    .fill(Color.green).brightness(0.3)
                    .frame(height: isAnimating ? circleHeight / 2.5 : circleHeight / 1.8)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: UUID())
                
                Group {
                    ArcShape(startAngle: .degrees(arcAngle1), endAngle: .degrees(arcAngle1 + 90))
                        .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    
                    ArcShape(startAngle: .degrees(arcAngle2), endAngle: .degrees(arcAngle2 + 90))
                        .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                }
                .frame(width: 190, height: 190)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: UUID())
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

struct ArcShape: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2,
                    startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
}

#Preview {
    ArcRotationAnimation(color: .black)
}
