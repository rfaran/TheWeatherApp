//
//  CurrentWeatherViewModelTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

@MainActor
final class CurrentWeatherViewModelTests: XCTestCase {

    let mockService = MockCurrentWeatherService(client: MockNetworkClient())

    func testFetchWeatherShouldSetWeatherModel() async {
        let mockResponse = CurrentWeatherResponse.mock()
        mockService.result = .success(CurrentWeatherModel(response: mockResponse))
        let viewModel = CurrentWeatherViewModel(service: mockService)

        await viewModel.fetchWeather()

        XCTAssertEqual(
            viewModel.weatherModel?.cityName,
            mockResponse.location.name
        )
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchWeatherForFailure() async {
        mockService.result = .failure(APIError.serverError("some message"))
        let viewModel = CurrentWeatherViewModel(service: mockService)

        await viewModel.fetchWeather()

        XCTAssertEqual(viewModel.errorMessage, "some message")
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.weatherModel)
    }

    func testFetchWeatherWhenCityIsEmpty() async {
        let viewModel = CurrentWeatherViewModel(service: mockService)
        viewModel.city = ""

        await viewModel.fetchWeather()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(
            viewModel.errorMessage,
            "City name is required."
        )
        XCTAssertNil(viewModel.weatherModel)
    }
}
