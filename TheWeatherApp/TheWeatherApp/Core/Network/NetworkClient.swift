//
//  NetworkClient.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

class URLSessionNetworkClient: NetworkClient {
    private let session: URLSession
    private let baseURL: String
    private let apiKey: String

    init(
        session: URLSession = .shared,
        baseURL: String,
        apiKey: String
    ) {
        self.session = session
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.makeRequest(
            baseURL: baseURL,
            apiKey: apiKey
        )

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode)
        else {
            throw APIError.serverError(APIErrorMessages.unknownError.message)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: data) {
                throw APIError.serverError((APIErrorMessages(rawValue: apiError.error.code) ?? .unknownError).message)
            } else {
                throw APIError.serverError(APIErrorMessages.unknownError.message)
            }
        }
    }
}
