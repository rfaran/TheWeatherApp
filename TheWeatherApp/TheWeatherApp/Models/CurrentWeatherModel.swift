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
    let forecast: [ForecastModel]

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

        forecast = response.forecast?.map { ForecastModel(forecast: $0) } ?? []
    }
}

struct ForecastModel: Hashable {
    let date: String
    let minTemperature: String
    let maxTemperature: String

    init(forecast: ForecastDay) {
        date = Date(timeIntervalSince1970: forecast.date).formattedAsDate()
        minTemperature = "\(forecast.minTemp)°"
        maxTemperature = "\(forecast.maxTemp)°"
    }
}


// Server response object
struct CurrentWeatherResponse: Decodable {
    let location: Location
    let current: CurrentResponse
    let forecast: [ForecastDay]?
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

struct ForecastDay: Decodable {
    let date: Double
    let minTemp: Int
    let maxTemp: Int

    enum CodingKeys: String, CodingKey {
        case date = "date_epoch"
        case minTemp = "mintemp"
        case maxTemp = "maxtemp"
    }
}
