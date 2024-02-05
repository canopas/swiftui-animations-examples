//
//  ThreeCircleBlinkingLines.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 05/02/24.
//

import SwiftUI

struct ThreeCircleBlinkingLines: View {
	
	@State var current = 0
	@State var color: Color
	
	let totalLines: Int = 10
	let height: CGFloat = 100
	let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
	
	init(color: Color) {
		self.color = color
	}
	
	var body: some View {
		ZStack {
			ForEach(0..<totalLines, id: \.self) { index in
				RoundedRectangle(cornerRadius: 5)
					.fill(color)
					.frame(width: 10, height: height / 3)
					.frame(height: height, alignment: .top)
					.rotationEffect(Angle(degrees: 360 / Double(totalLines) * Double(index)))
					.opacity(current == index ? 2 : current == index + 1 ? 0.5 : current == (totalLines - 1) && index == (totalLines - 1) ? 0.5 : 0.04)
			}
		}
		.onReceive(timer, perform: { _ in
			withAnimation(Animation.easeInOut(duration: 0.3).repeatCount(1, autoreverses: true)) {
				current = current == (totalLines - 1) ? 0 : current + 1
			}
		})
	}
}

#Preview {
	ThreeCircleBlinkingLines(color: .black)
}
