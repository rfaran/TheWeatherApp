//
//  TheWeatherAppApp.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

@main
struct TheWeatherApp: App {
    let client = URLSessionNetworkClient(
        baseURL: EnivronmentConfiguration.current.baseURL,
        apiKey: EnivronmentConfiguration.current.apiKey
    )

    var body: some Scene {
        WindowGroup {
            CurrentWeatherView(
                viewModel: .init(service: .init(client: client))
            )
        }
    }
}
