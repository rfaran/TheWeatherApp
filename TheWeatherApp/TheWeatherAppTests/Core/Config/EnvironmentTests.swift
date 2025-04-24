//
//  EnvironmentTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class EnvironmentTests: XCTestCase {
    func testDebugEnvironment() {
        let environment = Environment.debug

        XCTAssertEqual(
            environment.baseURL,
            "https://api.weatherstack.com"
        )
        XCTAssertEqual(
            environment.apiKey,
            "0760b0d28e803ec680110174587abf79"
        )
    }

    func testProductionEnvironment() {
        let environment = Environment.production

        XCTAssertEqual(
            environment.baseURL,
            "https://api.weatherstack.com"
        )
        XCTAssertEqual(
            environment.apiKey,
            "0760b0d28e803ec680110174587abf79"
        )
    }
}
