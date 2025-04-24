//
//  ErrorView.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        Text(message)
            .fontWeight(.medium)
            .foregroundColor(.red)
    }
}
