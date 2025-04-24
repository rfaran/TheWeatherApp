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

    init(response: CurrentWeatherResponse) {
        cityName = response.location.name
        currentDate = Date(timeIntervalSince1970: response.location.localtime).formattedAsDayAndDate()
        temperature = "\(response.current.temperature)°"
        description = response.current.description.first ?? ""
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
