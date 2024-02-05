//
//  ContentView.swift
//  Shared
//
//  Created by Jimmy S on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.init("bgColor")
			SquareFillAnimation(color: .white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
