//
//  CurrentWeatherEndpointTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class CurrentWeatherEndpointTests: XCTest {

    func testPath() {
        let endpoint = CurrentWeatherEndpoint(city: "New York")

        XCTAssertEqual(
            endpoint.path,
            "/forecast"
        )
    }

    func testMethod() {
        let endpoint = CurrentWeatherEndpoint(city: "New York")

        XCTAssertEqual(
            endpoint.method,
                .get
        )
    }
}
