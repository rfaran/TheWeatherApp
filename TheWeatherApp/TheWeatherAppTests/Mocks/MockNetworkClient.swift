//
//  MockNetworkClient.swift
//  TheWeatherAppTests
//
//  Created by Faran Rasheed on 4/23/25.
//

@testable import TheWeatherApp

class MockNetworkClient: NetworkClient {
    var result: Result<Decodable, Error>!

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        switch result {
        case .success(let value as T):
            return value
        case .failure(let error):
            throw error
        default:
            fatalError("Unexpected mock")
        }
    }
}

