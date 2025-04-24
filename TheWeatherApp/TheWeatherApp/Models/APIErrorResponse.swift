//
//  APIErrorResponse.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

// We need this, since the api returns status 200 but response contains error codes (old way) - need to parse it correctly.
struct APIErrorResponse: Decodable {
    let error: APIErrorDetail
}

struct APIErrorDetail: Decodable {
    let code: Int
    let info: String
}
