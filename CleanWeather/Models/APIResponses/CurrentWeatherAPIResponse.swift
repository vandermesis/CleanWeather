//
//  CurrentWeatherAPIResponse.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 23/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CurrentWeather: Codable, Equatable {

    let temperature: Double?
    let icon: String?
}
