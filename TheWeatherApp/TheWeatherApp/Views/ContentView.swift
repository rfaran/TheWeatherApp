//
//  ContentView.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

struct ContentView: View {

    @State private var weatherModel: WeatherModel?

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            VStack (spacing: 8) {
                Text(weatherModel?.cityName ?? "-")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                Text(weatherModel?.currentDate ?? "-")
                    .foregroundStyle(.white.opacity(0.8))

                Image(systemName: "cloud.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)

                Text(weatherModel?.temperatue ?? "-")
                    .font(.system(size: 80))
                    .fontWeight(.thin)
                    .foregroundStyle(.white)

                Text(weatherModel?.description ?? "-")
                    .foregroundStyle(.white.opacity(0.8))

                Spacer()
            }
            .padding(.top, 40)
        }
        .task {
            loadData()
        }
    }

    // Temp haardcoding to create a UI
    func loadData() {
        weatherModel = .init(
            cityName: "Hagerstown",
            currentDate: "Tuesday, April 23",
            temperatue: "72°",
            description: "Partly Cloudy"
        )
    }
}

#Preview {
    ContentView()
}
