//
//  Mock+CityListAPIResponse.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 23/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let CityListApiResponse = CityListAPIResponse(currently: CleanWeather.CurrentWeather(temperature: -3.68, icon: "cloudy"))
}
