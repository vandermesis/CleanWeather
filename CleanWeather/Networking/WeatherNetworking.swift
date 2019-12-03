//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchCityWeatherCompletion = (Result<CityWeather, Error>) -> Void
typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void
typealias FetchForecastCompletion = (Result<[CityForecast], Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?)
}

final class WeatherNetworkingImpl: WeatherNetworking {

    private let cities = CityDataBase.cityDB

    private let defaultSession = URLSession(configuration: .default)
    private let apiSecretKey = "/598abc19ca5e8af71b5f7110f11d1ccf"
    private let scheme = "https"
    private let host = "api.darksky.net"
    private let path = "/forecast"
    private let queryItems = [URLQueryItem(name: "exclude", value: "minutely,hourly,daily,flags,alerts"),
                              URLQueryItem(name: "lang", value: "en"),
                              URLQueryItem(name: "units", value: "si")]

    private var dataTask: URLSessionTask?

    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {

        var urlComponents = URLComponents()

        var cityWeather = [CityWeather]()

        //FIXME: How to be sure that every city gets it's data? I think now requests are to quick and sometimes it doesn't fill the array :(
        for city in cities {

            let location = "/\(city.latitude),\(city.longitude)"

            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.queryItems = queryItems
            urlComponents.path = path + apiSecretKey + location

            if let url = urlComponents.url {
                performRequest(with: url, for: city) { result in
                    switch result {
                    case .success(let weather):
                        cityWeather.append(weather)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }

        DispatchQueue.main.async {
            completion?(.success(cityWeather))
        }
    }
    
    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?) {
    
        var hour: [Int] {
            let hours = 0...23
            return hours.map { $0 }
        }
        
        var randomTemp: Double {
            return Double.random(in: -30...30)
        }
        
        var randomPrecip: Double {
            return Double.random(in: 0...1)
        }
        
        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
            let random = Int.random(in: 0...9)
            return icon[random]
        }
        
        var randomCityHourDetails: [CityForecast] {
            var array = [CityForecast]()
            for i in 0...23 {
                let cityWeatherHour = CityForecast(id: id, hour: hour[i], hourTemp: randomTemp, hourPrecipProbability: randomPrecip, icon: randomIcon)
                array.append(cityWeatherHour)
            }
            return array
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?(Result.success(randomCityHourDetails))
        }
    }
}

private extension WeatherNetworkingImpl {

        func performRequest(with url: URL, for city: City, completion: @escaping FetchCityWeatherCompletion) {
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in

                defer {
                    self?.dataTask = nil
                }

                if let receivedData = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let weather = self?.parseJSON(receivedData, for: city) {
                        return completion(Result.success(weather))
                    }
                }

                if let receivedError = error {
                    return completion(Result.failure(receivedError))
                }
            }
            dataTask?.resume()
        }

        func parseJSON(_ weatherData: Data, for city: City) -> CityWeather? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                let temp = decodedData.currently.temperature
                let icon = decodedData.currently.icon
                let weather = CityWeather(id: city.id, city: city.name, temperature: temp, icon: icon)
                return weather
            } catch {
                return nil
            }
        }
}
