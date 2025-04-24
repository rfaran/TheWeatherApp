//
//  TheWeatherApp.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

@main
struct TheWeatherApp: App {
    let client = URLSessionNetworkClient(
        baseURL: EnvironmentConfiguration.current.baseURL,
        apiKey: EnvironmentConfiguration.current.apiKey
    )

    var body: some Scene {
        WindowGroup {
            CurrentWeatherView(
                viewModel: .init(service: .init(client: client))
            )
        }
    }
}
