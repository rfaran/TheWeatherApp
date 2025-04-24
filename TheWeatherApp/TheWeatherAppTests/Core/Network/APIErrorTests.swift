//
//  APIErrorTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class APIErrorTests: XCTestCase {
    func testInvalidURLMessage() {
        let error = APIError.invalidURL

        XCTAssertEqual(
            error.message,
            "The URL is invalid. Please check the URL."
        )
    }

    func testServerErrorMessage() {
        let serverErrorMessage = "Server is down"

        let error = APIError.serverError(serverErrorMessage)

        XCTAssertEqual(
            error.message,
            serverErrorMessage
        )
    }

    func testAPIErrorMessages() {
        XCTAssertEqual(
            APIErrorMessages.requestFailed.message,
            "We’re having trouble processing your request. Please try again."
        )
        XCTAssertEqual(
            APIErrorMessages.unknownError.message,
            "An unknown error occurred. Please try again."
        )
    }
}
