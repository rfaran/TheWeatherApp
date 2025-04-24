//
//  MockCurrentWeatherService.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

@testable import TheWeatherApp

final class MockCurrentWeatherService: CurrentWeatherService {
    var result: Result<CurrentWeatherModel, Error>!

    override func fetchWeather(for city: String) async throws -> CurrentWeatherModel {
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        default:
            fatalError("invalid mock")
        }
    }
}
