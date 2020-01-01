//
//  Mock+CityHistoricalApiResponse.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 19/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityHistoricalApiResponse = CityHistoricalAPIResponse(currently: CleanWeather.CurrentWeather(temperature: -6.38, icon: "cloudy"))
}
