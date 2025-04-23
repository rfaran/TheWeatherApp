//
//  ContentView.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            VStack (spacing: 20) {
                VStack(spacing: 8) {
                    Text("Hagerstown")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    Text("Tuesday, April 23")
                        .font(.title3)
                        .foregroundStyle(.white.opacity(0.8))
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
