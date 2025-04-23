//
//  APIErrorResponse.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

struct APIErrorResponse: Decodable {
    let error: APIErrorDetail
}

struct APIErrorDetail: Decodable {
    let code: Int
    let info: String
}
