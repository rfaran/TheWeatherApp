//
//  CurrentWeatherViewModel.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

@MainActor
class CurrentWeatherViewModel: ObservableObject {
    @Published var city: String = "Hagerstown"
    @Published var weatherModel: CurrentWeatherModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: CurrentWeatherService

    init(service: CurrentWeatherService) {
        self.service = service
    }

    func fetch() async {
        isLoading = true
        errorMessage = nil

        do {
            weatherModel = try await service.fetchWeather(for: city)
        } catch {
            errorMessage = "Some error occured"
        }

        isLoading = false
    }
}
