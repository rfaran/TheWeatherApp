//
//  CurrentWeatherServiceTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class CurrentWeatherServiceTests: XCTestCase {

    func testFetchWeatherReturnsModel() async throws {
        let mockClient = MockNetworkClient()
        let mockObject = CurrentWeatherResponse.mock()
        mockClient.result = .success(mockObject)
        let service = CurrentWeatherService(client: mockClient)

        let weather = try await service.fetchWeather(for: "Hagerstown")

        XCTAssertEqual(
            weather.cityName,
            mockObject.location.name
        )
    }

}
