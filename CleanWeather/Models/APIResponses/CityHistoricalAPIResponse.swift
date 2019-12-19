//
//  CityHistoricalAPIResponse.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityHistoricalAPIResponse: Codable, Equatable {

    let currently: Current

    struct Current: Codable, Equatable {

        let temperature: Double?
        let icon: String?
    }
}
