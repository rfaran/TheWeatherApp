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
    let temperatue: String
    let description: String

    init(response: CurrentWeatherResponse) {
        cityName = response.location.name
        currentDate = Date(timeIntervalSince1970: response.location.localtime).formattedAsDayAndDate()
        temperatue = "0°C"
        description = "Sunny"
    }
}

// Server response object
struct CurrentWeatherResponse: Decodable {
    let location: Location
}

struct Location: Decodable {
    let name: String
    let localtime: Double

    enum CodingKeys: String, CodingKey {
        case name
        case localtime = "localtime_epoch"
    }
}
