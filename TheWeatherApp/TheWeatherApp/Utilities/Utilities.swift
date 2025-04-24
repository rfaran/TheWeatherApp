//
//  Utilities.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

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
