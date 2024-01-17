//
//  RotatingSquare.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI

struct FlippingSquare: View {
        
    @State private var isAnimatingOuter = false
    @State private var isAnimatingInner = false
    
    @State var color: Color = .black
    
    let height: CGFloat = 160
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(color)
                .frame(width: height, height: height)
                .rotation3DEffect(.degrees(isAnimatingOuter ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: false), value: UUID())
                .rotation3DEffect(.degrees(isAnimatingInner ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: false), value: UUID())
        }
        .onAppear {
            isAnimatingOuter = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isAnimatingInner = true
            }
        }
    }
}

#Preview {
    FlippingSquare(color: .black)
}
