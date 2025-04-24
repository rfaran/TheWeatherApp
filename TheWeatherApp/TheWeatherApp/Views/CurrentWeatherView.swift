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
            Color("BackgroundColor").ignoresSafeArea()

            ScrollView {
                VStack (spacing: 20) {
                    SearchBarView(city: $viewModel.city) {
                        Task {
                            await viewModel.fetchWeather()
                        }
                    }
                    if viewModel.isLoading {
                        LoadingView()
                    }
                    else if let error = viewModel.errorMessage {
                        ErrorView(message: error)
                    }
                    else if let weatherModel = viewModel.weatherModel {
                        WeatherInfoView(model: weatherModel)
                    }
                }
                .padding(.top, 30)
                .padding(.horizontal)
            }
        }
    }
}

struct WeatherInfoView: View {
    let model: CurrentWeatherModel

    var body: some View {
        VStack {
            Text(model.cityName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            Text(model.currentDate)
                .foregroundStyle(.white.opacity(0.8))

            Image(systemName: model.weatherIcon)
                .font(.system(size: 100))
                .foregroundStyle(.white, .yellow)

            Text(model.temperature)
                .font(.system(size: 80))
                .fontWeight(.thin)
                .foregroundStyle(.white)

            Text(model.description)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
}
