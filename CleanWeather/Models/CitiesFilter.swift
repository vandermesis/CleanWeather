//
//  CitiesFilter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

struct CitiesFilter {

    var filteringPhrase: String?
    var favouriteState: Bool?

    init (filteringPhrase: String? = nil,
          favouriteState: Bool? = nil) {
        self.filteringPhrase = filteringPhrase
        self.favouriteState = favouriteState
    }
}
