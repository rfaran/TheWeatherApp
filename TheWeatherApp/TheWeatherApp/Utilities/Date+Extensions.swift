//
//  Date+Extensions.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import Foundation

extension Date {
    func formattedAsDayAndDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: self)
    }
}
