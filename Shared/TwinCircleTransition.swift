//
//  TwinCircleTransition.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 12/07/22.
//

import SwiftUI

struct TwinCircleTransition: View {
    @State var tz: CGFloat = 0
    @State private var color1 = Color.blue
    @State private var color2 = Color.blue

    var body: some View {
        ZStack {
            VStack{}
                .frame(width: 150, height: 150, alignment: .center)
                .background(Color.white)
                .cornerRadius(100.0)
            
            VStack{}
                .frame(width: 75, height: 75, alignment: .center)
                .background(color1)
                .cornerRadius(50)
                .scaleEffect(abs(tz) * 0.3 + 1)
                .offset(x: tz * 70, y: 0)
            
            VStack{}
                .frame(width: 75, height: 75, alignment: .center)
                .background(color2)
                .cornerRadius(50)
                .scaleEffect(abs(tz) * 0.3 + 1)
                .offset(x: -tz * 70, y: 0)
        }
        .frame(width: 150, height: 150)
        .onAppear {
            animate()
        }
    }
    
    func animate() {
        withAnimation(.linear(duration: 0.15)) {
            tz = 1
            color1 = Color.cyan
            color2 = Color.green

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.linear(duration: 0.3)) {
                tz = -1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            withAnimation(.easeOut(duration: 1.0)) {
                tz = 0
                color1 = Color.blue
                color2 = Color.blue
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.55) {
            animate()
        }
    }
}

struct TwinCircleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TwinCircleTransition()
    }
}
