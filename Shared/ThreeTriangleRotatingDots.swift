//
//  ThreeTriangleRotatingDots.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 15/01/24.
//

import SwiftUI
import Combine

struct ThreeTriangleRotatingDots: View {
    
    @State var isAnimating: Bool = false
    @State var color: Color = .black
    
    private let height: CGFloat = 40
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .offset(x: 0, y: isAnimating ? -height : 0)
            
            Circle()
                .fill(color)
                .offset(x: isAnimating ? -height : 0, y: isAnimating ? height : 0)
            
            Circle()
                .fill(color)
                .offset(x: isAnimating ? height : 0, y: isAnimating ? height : 0)
        }
        .frame(height: height)
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: UUID())
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false), value: UUID())
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    ThreeTriangleRotatingDots(color: .black)
}
