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
            Color.yellow
            VStack {
                DotsAnimation()
                PacmanAnimation()
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
                TwinCircleAnimation()
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }.padding(30)
        }
    }
}


