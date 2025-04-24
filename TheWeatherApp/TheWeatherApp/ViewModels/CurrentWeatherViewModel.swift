//
//  CurrentWeatherViewModel.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

@MainActor
class CurrentWeatherViewModel: ObservableObject {
    // Other approach would be to have a state and the view could rely on the view state and render instead of keeping all these publishers.
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

        // We could do other validations to limit api usage
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
