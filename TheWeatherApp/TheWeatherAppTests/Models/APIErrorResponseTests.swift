//
//  APIErrorResponseTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class APIErrorResponseTests: XCTest {
    func testDecoding() throws {
        let json = """
            {
                "error": {
                    "code": 123,
                    "info": "Something went wrong"
                }
            }
            """.data(using: .utf8)!

        let response = try JSONDecoder().decode(APIErrorResponse.self, from: json)

        XCTAssertEqual(
            response.error.code,
            123
        )
        XCTAssertEqual(
            response.error.info,
            "Something went wrong"
        )
    }
}
