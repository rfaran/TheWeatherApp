//
//  SearchBarView.swift
//  TheWeatherApp
//
//  Created by Faran Rasheed on 4/23/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var city: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField(
                "Enter City",
                text: $city
            )
            .textFieldStyle(.roundedBorder)

            Button(
                "Search",
                action: onSearch
            )
            .buttonStyle(.borderedProminent)
        }
    }
}
