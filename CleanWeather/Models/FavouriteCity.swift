//
//  FavouriteCity.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct FavouriteCity: Codable {

    let name: String
    let lat: Double
    let lon: Double
    
    var favourite: Bool
}
