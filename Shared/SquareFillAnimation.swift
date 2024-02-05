//
//  SquareFillAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 17/01/24.
//

import SwiftUI

struct SquareFillAnimation: View {
    
    @State var color: Color
    @State private var isAnimatingOuter = false
    @State private var isAnimatingInner = false
    
    private let duration: CGFloat = 0.8
    private let squareHeight: CGFloat = 150
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: squareHeight, height: squareHeight)
                .scaleEffect(x: 1, y: isAnimatingInner ? 1 : 0, anchor: .bottom)
                .animation(Animation.easeInOut(duration: duration).delay(duration).repeatForever(autoreverses: false), value: UUID())
                .clipped()
            
            Rectangle()
                .stroke(color, lineWidth: 7)
                .frame(width: squareHeight, height: squareHeight)
                .rotationEffect(.degrees(isAnimatingOuter ? 180 : 0), anchor: .center)
                .animation(Animation.easeInOut(duration: duration).delay(duration).repeatForever(autoreverses: false), value: UUID())
        }
        .onAppear {
            isAnimatingOuter = true
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isAnimatingInner = true
            }
        }
    }
}

#Preview {
    SquareFillAnimation(color: .black)
}
