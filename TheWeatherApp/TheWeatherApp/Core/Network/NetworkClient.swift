//
//  APIClient.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async -> Result<T, APIError>
}

class URLSessionNetworkClient: NetworkClient {
    private let session: URLSession
    private let baseURL: String
    private let apiKey: String

    init(
        session: URLSession,
        baseURL: String,
        apiKey: String
    ) {
        self.session = session
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    func request<T: Decodable>(_ endpoint: Endpoint) async -> Result<T, APIError> {
        do {
            let request = try endpoint.makeRequest(
                baseURL: baseURL,
                apiKey: apiKey
            )
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode)
            else {
                return .failure(.unknown)
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return .success(decoded)
            } catch {
                return .failure(.decodingFailed(error))
            }
        } catch let error as APIError {
            return .failure(error)
        } catch {
            return .failure(.unknown)
        }
    }
}
