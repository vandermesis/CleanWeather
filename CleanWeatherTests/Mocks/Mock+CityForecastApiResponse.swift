//
//  Mock+CityForecastApiResponse.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 19/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityForecastApiResponse = CityForecastAPIResponse(hourly: CleanWeather.HourlyForecast(data: [CleanWeather.HourlyForecast.ForecastWeather(time: 1578247200.0, icon: "partly-cloudy-night", precipProbability: 0.04, temperature: -0.56),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578250800.0, icon: "partly-cloudy-night", precipProbability: 0.03, temperature: -0.94),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578254400.0, icon: "clear-night", precipProbability: 0.0, temperature: -1.21),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578258000.0, icon: "clear-night", precipProbability: 0.0, temperature: -1.37),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578261600.0, icon: "clear-night", precipProbability: 0.0, temperature: -1.54),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578265200.0, icon: "clear-night", precipProbability: 0.01, temperature: -1.71),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578268800.0, icon: "clear-night", precipProbability: 0.01, temperature: -1.77),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578272400.0, icon: "clear-night", precipProbability: 0.01, temperature: -1.74),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578276000.0, icon: "partly-cloudy-night", precipProbability: 0.01, temperature: -1.62),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578279600.0, icon: "partly-cloudy-night", precipProbability: 0.01, temperature: -1.52),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578283200.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: -1.56),
                                                                                                            CleanWeather.HourlyForecast.ForecastWeather(time: 1578286800.0, icon: "partly-cloudy-night", precipProbability: 0.0, temperature: -1.65)]),
                                                                 daily: CleanWeather.DailyForecast(data: [CleanWeather.DailyForecast.ForecastWeather(time: 1578178800.0, icon: "snow", precipProbability: 0.71, temperatureLow: -2.04, temperatureHigh: 1.28),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578265200.0, icon: "cloudy", precipProbability: 0.09, temperatureLow: -5.66, temperatureHigh: 2.01),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578351600.0, icon: "clear-day", precipProbability: 0.06, temperatureLow: -3.24, temperatureHigh: 2.22),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578438000.0, icon: "partly-cloudy-day", precipProbability: 0.01, temperatureLow: -0.3, temperatureHigh: 4.0),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578524400.0, icon: "partly-cloudy-day", precipProbability: 0.16, temperatureLow: 1.02, temperatureHigh: 4.06),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578610800.0, icon: "partly-cloudy-day", precipProbability: 0.23, temperatureLow: 0.42, temperatureHigh: 5.19),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578697200.0, icon: "clear-day", precipProbability: 0.13, temperatureLow: 0.71, temperatureHigh: 4.22),
                                                                                                          CleanWeather.DailyForecast.ForecastWeather(time: 1578783600.0, icon: "partly-cloudy-day", precipProbability: 0.09, temperatureLow: 1.02, temperatureHigh: 5.96)]))
}
