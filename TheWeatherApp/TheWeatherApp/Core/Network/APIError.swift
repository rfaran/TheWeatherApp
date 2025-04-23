//
//  APIError.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unknown
    case decodingFailed(Error)
    case serverError(APIErrorDetail)
}
