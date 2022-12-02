//
//  ClockAnimation.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 01/12/22.
//

import SwiftUI
import Combine

final class CurrentTime: ObservableObject {
    @Published var seconds: TimeInterval = CurrentTime.currentSecond(date: Date())

    private let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    private var store = Set<AnyCancellable>()

    init() {
        timer.map(Self.currentSecond).assign(to: \.seconds, on: self).store(in: &store)
    }

    private static func currentSecond(date: Date) -> TimeInterval {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let referenceDate = Calendar.current.date(from: DateComponents(year: components.year!, month: components.month!, day: components.day!))!
        return Date().timeIntervalSince(referenceDate)
    }
}

struct ClockAnimation: View {
    
    @ObservedObject var time = CurrentTime()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .background(Circle().fill(.white))
                .frame(width: 150, height: 150, alignment: .center)
            
            Clock(model: .init(type: .second, timeInterval: time.seconds))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
            
            Clock(model: .init(type: .minute, timeInterval: time.seconds))
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
        }
    }
}

struct Clock: Shape {
    var model: ClockTickerModel
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length = rect.width / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        path.move(to: center)
        let hoursAngle = CGFloat.pi / 2 - .pi * 2 * model.angleMultiplier
        path.addLine(to: CGPoint(x: rect.midX + cos(hoursAngle) * length * model.tickerScale,
                                 y: rect.midY - sin(hoursAngle) * length * model.tickerScale))
        return path
    }
}

struct ClockTickerModel {
    enum TickerType {
        case second
        case hour
        case minute
    }
    
    let type: TickerType
    let timeInterval: TimeInterval
    
    var angleMultiplier: CGFloat {
        switch type {
        case .second:
            return CGFloat(self.timeInterval.remainder(dividingBy: 60)) / 60
        case .hour:
            return CGFloat(timeInterval / 3600) / 12
        case .minute:
            return CGFloat((timeInterval - Double(Int(timeInterval / 3600) * 3600)) / 60) / 60
        }
    }
    
    var tickerScale: CGFloat {
        switch type {
        case .second:
            return 0.3
        case .hour:
            return 0.4
        case .minute:
            return 0.22
        }
    }
}


public struct Line: Shape {

    public init() {}

    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct ClockAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ClockAnimation()
    }
}
