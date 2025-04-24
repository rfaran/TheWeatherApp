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

    func fetchWeather() async {
        isLoading = true
        errorMessage = nil

        if city.isEmpty {
            errorMessage = "City name is required."
            isLoading = false
            return
        }

        do {
            weatherModel = try await service.fetchWeather(for: city)
        } catch let error as APIError {
            errorMessage = error.message
        } catch {
            errorMessage = APIErrorMessages.unknownError.message
        }

        isLoading = false
    }
}
