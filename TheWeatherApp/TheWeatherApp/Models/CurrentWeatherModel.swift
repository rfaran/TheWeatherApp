//
//  CurrentWeatherModel.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

// Domain layer model
struct CurrentWeatherModel {
    let cityName: String
    let currentDate: String
    let temperature: String
    let description: String
    let weatherIcon: String

    init(response: CurrentWeatherResponse) {
        cityName = response.location.name
        currentDate = Date(timeIntervalSince1970: response.location.localtime).formattedAsDayAndDate()
        temperature = "\(response.current.temperature)°"

        if let firstDescription = response.current.description.first {
            description = firstDescription

            let trimmedDescription = firstDescription.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            weatherIcon = WeatherCondition(rawValue: trimmedDescription)?.imageName ?? WeatherCondition.unknown.imageName
        } else {
            description = "Unknown"
            weatherIcon = WeatherCondition.unknown.imageName
        }
    }
}

// Server response object
struct CurrentWeatherResponse: Decodable {
    let location: Location
    let current: CurrentResponse
}

struct Location: Decodable {
    let name: String
    let localtime: Double

    enum CodingKeys: String, CodingKey {
        case name
        case localtime = "localtime_epoch"
    }
}

struct CurrentResponse: Decodable {
    let temperature: Int
    let description: [String]

    enum CodingKeys: String, CodingKey {
        case temperature
        case description = "weather_descriptions"
    }
}
