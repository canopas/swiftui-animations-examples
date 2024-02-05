//
//  ThreeHorizontalSwapingDots.swift
//  SwiftUIAnimations
//
//  Created by Amisha Italiya on 16/01/24.
//

import SwiftUI
import Combine

struct ThreeHorizontalSwapingDots: View {
	
	// We can set static points too
	@State private var dotPositions: [CGPoint] = [
		CGPoint(x: 0, y: 0),
		CGPoint(x: 0, y: 0),
		CGPoint(x: 0, y: 0)
	]
	
	@State var color: Color
	
	private let dotSpacing: CGFloat = 10
	private let triangleHeight: CGFloat = 50
	
	init(color: Color) {
		self.color = color
	}
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				ForEach(0..<3) { index in
					Circle()
						.fill(color)
						.frame(height: triangleHeight)
						.position(dotPositions[index])
				}
			}
			.onAppear {
				let centerX = geometry.size.width / 2
				let centerY = geometry.size.height / 2 + 20
				
				// Set initial positions to the middle of the screen
				dotPositions[0] = CGPoint(x: centerX, y: centerY - triangleHeight)
				dotPositions[1] = CGPoint(x: centerX - triangleHeight - dotSpacing, y: centerY - triangleHeight)
				dotPositions[2] = CGPoint(x: centerX + triangleHeight + dotSpacing, y: centerY - triangleHeight)
				
				// Start the rotation animation in the opposite direction
				withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: false)) {
					let temp = dotPositions[2]
					dotPositions[2] = dotPositions[1]
					dotPositions[1] = dotPositions[0]
					dotPositions[0] = temp
				}
			}
		}
	}
}

#Preview {
	ThreeHorizontalSwapingDots(color: .black)
}
