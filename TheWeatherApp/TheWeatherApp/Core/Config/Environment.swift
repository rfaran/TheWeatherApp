//
//  Environment.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

// TIP: We could use build configurations and schemes to manage this as well.
enum Environment {
    case debug
    case production
    // and so on

    var baseURL: String {
        switch self {
        case .debug:
            return "https://api.weatherstack.com"
        case .production:
            return "https://api.weatherstack.com"
        }
    }

    var apiKey: String {
        switch self {
        case .debug:
            return "0760b0d28e803ec680110174587abf79"
        case .production:
            return "0760b0d28e803ec680110174587abf79"
        }
    }
}

struct EnvironmentConfiguration {
    static let current: Environment = {
        #if DEBUG
        .debug

        #else
        .production

        #endif
    }()
}
