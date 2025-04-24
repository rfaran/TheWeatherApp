//
//  EndpointTests.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

import XCTest

@testable import TheWeatherApp

final class EndpointTests: XCTestCase {
    func testHTTPMethod() {
        XCTAssertEqual(
            HTTPMethod.get.rawValue,
            "GET"
        )
        XCTAssertEqual(
            HTTPMethod.post.rawValue,
            "POST"
        )
    }

    struct TestEndpoint: Endpoint {
        var path: String = "/path"
        var method: HTTPMethod = .get
        var queryItems: [URLQueryItem]? = [
            URLQueryItem(name: "query", value: "Hagerstown")
        ]
    }
    struct InvalidEndpoint: Endpoint {
        var path: String = "\\invalid path"
        var method: HTTPMethod = .get
        var queryItems: [URLQueryItem]? = [
            URLQueryItem(name: "query", value: "Hagerstown")
        ]
    }

    func testValidMakeRequest() throws {
        let endpoint = TestEndpoint()
        let baseURL = "https://some.dummy.url.com"
        let apiKey = "some_dummy_key"

        let request = try endpoint.makeRequest(
            baseURL: baseURL,
            apiKey: apiKey
        )

        XCTAssertEqual(
            request.httpMethod,
            "GET"
        )
        XCTAssertTrue((request.url?.absoluteString.contains("query=Hagerstown")) != nil)
        XCTAssertTrue((request.url?.absoluteString.contains("access_key=some_dummy_key")) != nil)
    }

    func testInvalidRequest() {
        let endpoint = InvalidEndpoint()
        let baseURL = "https://some.dummy.url.com"
        let apiKey = "some_dummy_key"

        XCTAssertThrowsError(
            try endpoint.makeRequest(
                baseURL: baseURL,
                apiKey: apiKey
            )
        )
    }
}
