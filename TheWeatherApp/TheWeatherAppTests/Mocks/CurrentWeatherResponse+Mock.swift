//
//  CurrentWeatherResponse+Mock.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

@testable import TheWeatherApp

extension CurrentWeatherResponse {
    static func mock() -> CurrentWeatherResponse {
        .init(
            location: .init(
                name: "Hagerstown",
                localtime: 1745442060
            ),
            current: .init(
                temperature: 60,
                description: ["Cloudy"]
            ),
            forecast: [
                .init(
                    date: 1746038400,
                    minTemp: 55,
                    maxTemp: 75
                )
            ]
        )
    }
}
