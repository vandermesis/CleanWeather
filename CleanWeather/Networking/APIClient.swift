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

    private var dataTask: URLSessionTask?
    
    func perform<T>(request: Request<T>) {

        var urlComponents = URLComponents()

        urlComponents.scheme = request.scheme
        urlComponents.host = request.url
        urlComponents.path = request.path
        if let parameters = request.parameters {
            urlComponents.setQueryItems(with: parameters)
        }
        
        guard let url = urlComponents.url else { fatalError("no url") }

        print(url.absoluteString)

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
    }
}
