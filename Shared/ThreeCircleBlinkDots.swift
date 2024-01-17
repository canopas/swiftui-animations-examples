//
//  ThreeCircleBlinkDots.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI
import Combine

struct ThreeCircleBlinkDots: View {
    
    @State var current = 0
    @State var color: Color = .black
    
    private let totalDots = 7
    private let height: CGFloat = 100
    private let timer = Timer.publish(every: 0.35, on: .main, in: .common).autoconnect()
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<totalDots, id: \.self) { index in
                Circle()
                    .fill(color)
                    .frame(height: height / 4)
                    .frame(height: height, alignment: .top)
                    .rotationEffect(Angle(degrees: 360 / Double(totalDots) * Double(index)))
                    .opacity(current == index ? 1.0 : current == index + 1 ? 0.5 :
                             current == (totalDots - 1) && index == (totalDots - 1) ? 0.5 : 0)
            }
        }
        .onReceive(timer, perform: { _ in
            withAnimation(Animation.easeInOut(duration: 1).repeatCount(1, autoreverses: true)) {
                current = current == (totalDots - 1) ? 0 : current + 1
            }
        })
    }
}

#Preview {
    ThreeCircleBlinkDots(color: .black)
}
