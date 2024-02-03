//
//  RotatingSquare.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI

struct FlippingSquare: View {
        
    @State private var isAnimatingVertically = false
    @State private var isAnimatingHorizontally = false
    
    @State var color: Color
    
    let height: CGFloat = 120
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(color)
                .frame(width: height, height: height)
                .rotation3DEffect(.degrees(isAnimatingVertically ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: false), value: UUID())
                .rotation3DEffect(.degrees(isAnimatingHorizontally ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: false), value: UUID())
        }
        .onAppear {
            isAnimatingVertically = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isAnimatingHorizontally = true
            }
        }
    }
}

#Preview {
    FlippingSquare(color: .black)
}
