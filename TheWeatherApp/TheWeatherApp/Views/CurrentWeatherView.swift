//
//  CurrentWeatherView.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

struct CurrentWeatherView: View {

    @StateObject var viewModel: CurrentWeatherViewModel

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            TextField("Enter City", text: $viewModel.city)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Get Weather") {
                Task {
                    await viewModel.fetch()
                }
            }
            .buttonStyle(.borderedProminent)


            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else if let weatherModel = viewModel.weatherModel {
                VStack (spacing: 8) {
                    Text(weatherModel.cityName)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    Text(weatherModel.currentDate)
                        .foregroundStyle(.white.opacity(0.8))

                    Image(systemName: "cloud.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)

                    Text(weatherModel.temperatue)
                        .font(.system(size: 80))
                        .fontWeight(.thin)
                        .foregroundStyle(.white)

                    Text(weatherModel.description)
                        .foregroundStyle(.white.opacity(0.8))

                    Spacer()
                }
                .padding(.top, 40)
            }
        }
    }
}
