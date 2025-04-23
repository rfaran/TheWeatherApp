//
//  WeatherService.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

class WeatherService {
    private let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    func fetchWeather(for city: String) async throws -> WeatherModel {
        let endpoint = CurrentWeatherEndpoint(city: city)
        let response: WeatherResponse = try await client.request(endpoint)

        return .init(
            cityName: response.location.name,
            currentDate: response.location.localtime,
            temperatue: "72°",
            description: "Partly Cloudy"
        )
    }
}
