//
//  APIError.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case serverError(String)

    var message: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid. Please check the URL."
        case .serverError(let message):
            return message
        }
    }
}


enum APIErrorMessages: Int {
    case requestFailed = 615
    case unknownError = 999
    // and many more..

    var message: String {
        switch self {
        case .requestFailed:
            "We’re having trouble processing your request. Please try again."
        default:
            "An unknown error occurred. Please try again."
        }
    }
}
