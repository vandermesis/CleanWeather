//
//  APIClient.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 13/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

final class APIClient {

    private let defaultSession = URLSession(configuration: .default)
    private let path = "/api/records/1.0/search/"

    private var dataTask: URLSessionTask?
    
    func perform(request: Request) {

        var urlComponents = URLComponents()
        var allCities = [City]()

        urlComponents.scheme = "https"
        urlComponents.host = request.url
        urlComponents.queryItems = Parameters.queryItems
        urlComponents.path = path

        guard let url = urlComponents.url else { fatalError("no url") }

        print(url)

        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in

            defer {
                self?.dataTask = nil
            }

            if let receivedData = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print(receivedData)
            }

            if let receivedError = error {
                print(receivedError)
            }
        }
        dataTask?.resume()

        DispatchQueue.main.async {
            request.completion?(.success(allCities))
        }
    }
}
