//
//  HeartAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 06/05/22.
//

import SwiftUI

struct HeartAnimation: View {
    
    @State var transY: CGFloat = 0
    @State var alpha: CGFloat = 1.0

    var foreverAnimation =
        Animation.linear.speed(0.3)
            .repeatForever(autoreverses: true)

    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 60))
                .foregroundColor(Color.white)
                .offset(x: 0, y: transY)
                .onAppear {
                    withAnimation(foreverAnimation) {
                        transY = -25
                    }
                }
            VStack{
                
            }.frame(width: 50, height: 10, alignment: .center)
                .background(Color.white)
                .cornerRadius(10.0)
                    .opacity(alpha)
                    .scaleEffect(x: alpha, y: 1.0, anchor: UnitPoint.center)
                    .onAppear {
                        withAnimation(foreverAnimation) {
                            alpha = 0.4
                        }
                    }
        }
    }
}

struct HeartAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HeartAnimation()
    }
}
