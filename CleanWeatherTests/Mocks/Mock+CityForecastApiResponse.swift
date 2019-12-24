//
//  Mock+CityForecastApiResponse.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 19/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityForecastApiResponse = CityForecastAPIResponse(hourly: CleanWeather.CityForecastAPIResponse.HourlyForecast(data: [CleanWeather.CityForecastAPIResponse.HourlyForecast.ForecastData(time: 1576713600.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: 5.32), CleanWeather.CityForecastAPIResponse.HourlyForecast.ForecastData(time: 1576717200.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: 5.11), CleanWeather.CityForecastAPIResponse.HourlyForecast.ForecastData(time: 1576720800.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: 4.95), CleanWeather.CityForecastAPIResponse.HourlyForecast.ForecastData(time: 1576724400.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: 4.77), CleanWeather.CityForecastAPIResponse.HourlyForecast.ForecastData(time: 1576728000.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: 4.5)]))
}
