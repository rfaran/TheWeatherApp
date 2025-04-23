//
//  WeatherModel.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

// Domain layer model
struct CurrentWeatherModel {
    let cityName: String
    let currentDate: String
    let temperatue: String
    let description: String
}

// Server response object
struct CurrentWeatherResponse: Decodable {
    let location: Location
}

struct Location: Decodable {
    let name: String
    let localtime: String
}
