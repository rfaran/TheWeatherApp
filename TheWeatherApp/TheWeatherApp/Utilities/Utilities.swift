//
//  Utilities.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

// Utility to return SF symbol based on description (since api does not return any other status)
enum WeatherCondition: String {
    case sunny = "sunny"
    case partlyCloudy = "partly cloudy"
    case cloudy = "cloudy"
    case rain = "rain"
    case haze = "haze"
    case unknown

    var imageName: String {
        switch self {
        case .sunny:
            "sun.max.fill"
        case .partlyCloudy:
            "cloud.sun.fill"
        case .cloudy:
            "cloud.fill"
        case .rain:
            "cloud.rain.fill"
        case .haze:
            "cloud.fog.fill"
        case .unknown:
            "questionmark.circle"
        }
    }
}
