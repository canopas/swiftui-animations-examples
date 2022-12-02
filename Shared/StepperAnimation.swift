//
//  StepperAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 06/05/22.
//

import SwiftUI

struct StepperAnimation: View {

    @State var front: Int = 0
    @State var back: Int = 0
    
    @State var isFront = true
    
    @State private var animatedAngle = 0.0

    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Text("\(isFront ? front : back)")
                    .font(.system(size: 25))

                HStack {
                    VStack {
                    }
                    .frame(width: 125, height: 100, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onFlipPrevious()
                    }
                    
                    VStack {
                    }
                    .frame(width: 125, height: 100, alignment: .trailing)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onFlipNext()
                    }
                }
            }
            .zIndex(isFront ? 1: 0)
            .rotation3DEffect(Angle(degrees : isFront ? 0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
        }
        .rotation3DEffect(Angle(degrees: animatedAngle), axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(Animation.linear(duration: 0.6), value: animatedAngle)
        .frame(width: 250, height: 100, alignment: .center)
    }
    
    func onFlipPrevious() {
        if(isFront) {
            back = front - 1
        } else {
            front = back - 1
        }
        animatedAngle -= 180.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isFront = !isFront
        }
    }
    
    func onFlipNext() {
        if(isFront) {
            back = front + 1
        } else {
            front = back + 1
        }
        animatedAngle += 180.0
        DispatchQueue.main.asyncAfter(deadline:  .now() + 0.3) {
            isFront = !isFront
        }
    }
}
