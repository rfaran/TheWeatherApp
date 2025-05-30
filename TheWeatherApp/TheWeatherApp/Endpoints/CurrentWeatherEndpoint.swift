//
//  CurrentWeatherEndpoint.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

struct CurrentWeatherEndpoint: Endpoint {
    let city: String

    var path: String { "/current" }
    //var path: String { "/forecast" } // Use /forecast after maping local data.
    var method: HTTPMethod { .get }
    var queryItems: [URLQueryItem]? {
        [
            .init(name: "query", value: city),
            .init(name: "units", value: "f")
        ]
    }
}
