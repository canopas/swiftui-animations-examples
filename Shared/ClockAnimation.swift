//
//  ClockAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 01/12/22.
//

import SwiftUI

struct ClockAnimation: View {
    
    @State private var duration = 1.2
    @State private var startAnimation = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .background(Circle().fill(.white))
                .frame(width: 150, height: 150, alignment: .center)
            
            Line(type: .second)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5.5, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(startAnimation ? 360 : 0))
                .animation(.linear(duration: duration).repeatForever(autoreverses: false), value: startAnimation)
            
            Line(type: .minute)
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(startAnimation ? 360 : 0))
                .animation(.linear(duration: duration * 6).repeatForever(autoreverses: false), value: startAnimation)
        }
        .onAppear {
            self.startAnimation.toggle()
        }
    }
}

public struct Line: Shape {
    
    var lineType: LineType
    
    init(type: LineType) {
        self.lineType = type
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: center)
        
        let length = rect.width / 2
        path.addLine(to: CGPoint(x: rect.midX + (2 / .pi) * length * lineType.scale,
                                 y: rect.midY - (2 / .pi) * length * lineType.scale))
        return path
    }
}

enum LineType {
    case minute
    case second
    
    var scale: CGFloat {
        switch self {
        case .minute:
            return 0.25
        case .second:
            return 0.3
        }
    }
}


struct ClockAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ClockAnimation()
    }
}
