//
//  Endpoint.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // delete etc
}

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }

    func makeRequest(
        baseURL: String,
        apiKey: String
    ) throws -> URLRequest
}

extension Endpoint {
    func makeRequest(
        baseURL: String,
        apiKey: String
    ) throws -> URLRequest {
        var components = URLComponents(string: baseURL + path)

        var query = queryItems ?? []
        query.append(URLQueryItem(name: "access_key", value: apiKey))
        components?.queryItems = query

        guard let url = components?.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
