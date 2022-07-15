//
//  PacmanAnimation.swift
//  SwiftUIAnimations
//
//  Created by Jimmy S on 12/07/22.
//

import SwiftUI

struct PacmanAnimation: View {
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let timenow  = timeline.date.timeIntervalSince1970 * 200
                let delta = min(50, abs(timenow.remainder(dividingBy: 100)))
                
                let center = CGPoint(x: size.width/2, y: size.height/2)
                var path = Path()
                path.addArc(center: center, radius: size.width/2, startAngle: Angle(degrees: delta), endAngle: Angle(degrees: 360 - delta), clockwise: false
                )
                path.addLine(to: center)
                
                context.fill(path, with: .color(.white))
                context.fill(Path(ellipseIn: CGRect(x: size.width / 2, y: size.height / 4, width: 10, height: 10)), with: .color(.black))
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct PacmanAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PacmanAnimation()
    }
}
