//
//  RotatingDotAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 30/11/22.
//

import SwiftUI
import Combine

struct RotatingDotAnimation: View {
    
    @State private var startAnimation = false
    @State private var duration = 1.0 // Works as speed, since it repeats forever
    
    @State var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .foregroundColor(color.opacity(0.5))
                .frame(width: 150, height: 150, alignment: .center)
            
            Circle()
                .fill(color)
                .frame(width: 18, height: 18, alignment: .center)
                .offset(x: -63)
                .rotationEffect(.degrees(startAnimation ? 360 : 0))
                .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                           value: startAnimation
                )
        }
        .onAppear {
            self.startAnimation.toggle()
        }
    }
}

struct RotatingSquare_Previews: PreviewProvider {
    static var previews: some View {
        RotatingDotAnimation(color: .black)
    }
}
