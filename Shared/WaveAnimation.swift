//
//  WaveAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 06/05/22.
//

import SwiftUI

struct WaveAnimation: View {
    @State var scale1: CGFloat = 0
    @State var scale2: CGFloat = 0
    @State var scale3: CGFloat = 0

    var foreverAnimation =
        Animation.linear.speed(0.2)
            .repeatForever(autoreverses: false)

    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .font(.system(size: 60))
                .foregroundColor(Color.white)
                .opacity(1 - scale1)
                .scaleEffect(1 + (scale1 * 2))
                .onAppear {
                        withAnimation(foreverAnimation) {
                            scale1 = 1
                        }
                    }
            Image(systemName: "circle.fill")
                .font(.system(size: 60))
                .foregroundColor(Color.white)
                .opacity(1 - scale2)
                .scaleEffect(1 + (scale2 * 2))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(foreverAnimation) {
                            scale2 = 1
                        }
                    }
                }
            Image(systemName: "circle.fill")
                .font(.system(size: 60))
                .foregroundColor(Color.white)
                .opacity(1 - scale3)
                .scaleEffect(1 + (scale3 * 2))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(foreverAnimation) {
                            scale3 = 1
                        }
                    }
                }
            Image(systemName: "magnifyingglass")
                .frame(width: 60, height: 60, alignment: .center)
                .font(.system(size: 20))
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(30)


        }
    }
}
