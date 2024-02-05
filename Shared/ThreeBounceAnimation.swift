//
//  ThreeBounceAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 30/11/22.
//

import SwiftUI
import Combine

struct ThreeBounceAnimation: View {
    
    struct AnimationData {
        var delay: TimeInterval
    }
    
    static let DATA = [
        AnimationData(delay: 0.0),
        AnimationData(delay: 0.2),
        AnimationData(delay: 0.4),
    ]
    
    @State var color: Color
    @State var scales: [CGFloat] = DATA.map { _ in return 0 }
    
    var animation = Animation.easeInOut.speed(0.5)
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        HStack {
            DotView(color: .constant(color), scale: .constant(scales[0]))
            DotView(color: .constant(color), scale: .constant(scales[1]))
            DotView(color: .constant(color), scale: .constant(scales[2]))
        }
        .onAppear {
            animateDots()
        }
    }
    
    func animateDots() {
        for (index, data) in Self.DATA.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + data.delay) {
                animateDot(binding: $scales[index], animationData: data)
            }
        }
        
        //Repeat
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            animateDots()
        }
    }
    
    func animateDot(binding: Binding<CGFloat>, animationData: AnimationData) {
        withAnimation(animation) {
            binding.wrappedValue = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(animation) {
                binding.wrappedValue = 0.2
            }
        }
    }
}

private struct DotView: View {
    
    @Binding var color: Color
    @Binding var scale: CGFloat
    
    var body: some View {
        Circle()
            .scale(scale)
            .fill(color.opacity(scale >= 0.7 ? scale : scale - 0.1))
            .frame(width: 50, height: 50, alignment: .center)
    }
}

struct ThreeBounceAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ThreeBounceAnimation(color: .black)
    }
}


