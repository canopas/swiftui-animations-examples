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

            VStack(spacing: 100) {
                Spacer()
                
//                RotatingDotAnimation()
//                
//                ThreeBounceAnimation()
                
                ClockAnimation()
                
                Spacer()
            }
            .padding(20)
        }
        .ignoresSafeArea()
    }
}


