//
//  ThreeRotatingDots.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 15/01/24.
//

import SwiftUI

struct ThreeRotatingDots: View {
    
    @State var isAnimating: Bool = false
    
    @State var color: Color
    
    private let height: CGFloat = 40
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(color)
                    .frame(height: height, alignment: .center)
            }
        }
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false), value: UUID())
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    ThreeRotatingDots(color: .black)
}
