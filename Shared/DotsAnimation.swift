//
//  DotsAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 06/05/22.
//

import SwiftUI

struct DotsAnimation: View {
    
    struct AnimationData {
        var delay: TimeInterval
        var ty: CGFloat
    }

    static let DATA = [
        AnimationData(delay: 0.0, ty: -50),
        AnimationData(delay: 0.1, ty: -60),
        AnimationData(delay: 0.2, ty: -70),
    ]

    @State var transY: [CGFloat] = DATA.map { _ in return 0 }
    
    var animation = Animation.easeInOut.speed(0.6)

    var body: some View {
        HStack {
            DotView(transY: $transY[0])
            DotView(transY: $transY[1])
            DotView(transY: $transY[2])
        }
        .onAppear {
            animateDots()
        }
    }
    
    func animateDots() {
        for (index, data) in Self.DATA.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + data.delay) {
                animateDot(binding: $transY[index], animationData: data)
            }
        }
        
        //Repeat
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            animateDots()
        }
    }

    func animateDot(binding: Binding<CGFloat>, animationData: AnimationData) {
        withAnimation(animation) {
            binding.wrappedValue = animationData.ty
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(animation) {
                binding.wrappedValue = 0
            }

        }
    }
}

private struct DotView: View {
    @Binding var transY: CGFloat

    var body: some View {
            VStack{}.frame(width: 40, height: 40, alignment: .center)
                .background(Color.white)
                .cornerRadius(20.0)
                .offset(x: 0, y: transY)
    }
}

struct DotsAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DotsAnimation()
    }
}
