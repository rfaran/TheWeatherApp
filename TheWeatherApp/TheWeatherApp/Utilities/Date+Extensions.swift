//
//  Date+Extensions.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

extension Date {
    // Returns formatted date as Thursday, April 24
    func formattedAsDayAndDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: self)
    }

    // Returns formatted date April 24
    func formattedAsDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: self)
    }
}
