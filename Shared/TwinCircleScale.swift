//
//  TwinCircleScale.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI

struct TwinCircleScale: View {
    
    @State private var isAnimating = false
    
    private let circleHeight: CGFloat = 150
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.mint)
                .frame(width: circleHeight, height: circleHeight)
            
            Circle()
                .fill(Color.white)
                .frame(height: isAnimating ? circleHeight / 8 : circleHeight)
                .offset(x: isAnimating ? 20 : 0) // Adjust the offset for the desired overlap
            
            Circle()
                .fill(Color.white)
                .frame(height: isAnimating ? circleHeight / 8 : circleHeight)
                .offset(x: isAnimating ? -20 : 0) // Adjust the offset for the desired overlap
        }
        .clipShape(Circle())
        .animation(.easeInOut(duration: 1.3).delay(0.1).repeatForever(autoreverses: true), value: UUID())
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    TwinCircleScale()
}
