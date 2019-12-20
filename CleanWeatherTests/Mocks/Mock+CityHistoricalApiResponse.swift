//
//  Mock+CityHistoricalApiResponse.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 19/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let CityHistoricalApiResponse = CityHistoricalAPIResponse(currently: CleanWeather.CityHistoricalAPIResponse.CurrentWeather(temperature: Optional(-6.38), icon: Optional("cloudy")))
}
