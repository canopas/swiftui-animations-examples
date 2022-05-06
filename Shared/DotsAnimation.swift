//
//  DotsAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 06/05/22.
//

import SwiftUI

struct DotsAnimation: View {
    @State var transY: CGFloat = 0

    var foreverAnimation =
        Animation.linear.speed(0.3)
        .delay(1000)
            .repeatForever(autoreverses: true)

    var body: some View {
        HStack {
            VStack{
                
            }.frame(width: 40, height: 40, alignment: .center)
                .background(Color.white)
                .cornerRadius(20.0)
                .offset(x: 0, y: transY)
                    .onAppear {
                        withAnimation(foreverAnimation) {
                            transY = 10
                        }
                    }
            VStack{
                
            }.frame(width: 40, height: 40, alignment: .center)
                .background(Color.white)
                .cornerRadius(20.0)
                    .onAppear {
//                        withAnimation(foreverAnimation) {
//                            transY = 0.4
//                        }
                    }

            VStack{
                
            }.frame(width: 40, height: 40, alignment: .center)
                .background(Color.white)
                .cornerRadius(20.0)
                    .onAppear {
//                        withAnimation(foreverAnimation) {
//                            transY = 0.4
//                        }
                    }

        }
    }
}

struct DotsAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DotsAnimation()
    }
}
