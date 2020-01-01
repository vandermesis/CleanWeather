//
//  City.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 04/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct City: Codable, Equatable {

    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}

extension Array where Element == City {
    func sortByName() -> [City] {
        return self.sorted(by: { $0.name < $1.name })
    }
}
