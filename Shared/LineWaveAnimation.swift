//
//  LineWaveAnimation.swift
//  SwiftUIAnimations (iOS)
//
//  Created by Amisha Italiya on 05/02/24.
//

import SwiftUI

struct LineWaveAnimation: View {
    
    @State var color: Color
    @State var isAnimating = false
    
    let lineCount = 5
    let lineHeight: CGFloat = 100
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(0..<lineCount, id: \.self) { index in
                RoundedRectangle(cornerRadius: 5)
                    .fill(color)
                    .frame(width: 12, height: lineHeight)
                    .scaleEffect(y: isAnimating ? 0.4 : 1)
                    .animation(Animation.easeInOut(duration: 0.65).repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.2), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    LineWaveAnimation(color: .black)
}
