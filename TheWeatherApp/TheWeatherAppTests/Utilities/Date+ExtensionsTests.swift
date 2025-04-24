//
//  Date+ExtensionsTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class UtilitiesTests: XCTestCase {
    func testFormattedAsDayAndDate() {
        let date = Date(timeIntervalSince1970: 1745442060)

        let formatted = date.formattedAsDayAndDate()

        XCTAssertEqual(
            formatted,
            "Wednesday, April 23"
        )
    }

    func formattedAsDate() {
        let date = Date(timeIntervalSince1970: 1745442060)

        let formatted = date.formattedAsDate()

        XCTAssertEqual(
            formatted,
            "April 23"
        )
    }
}
