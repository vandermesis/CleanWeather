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
    private var urlComponents = URLComponents()
    
    func perform<T>(request: Request<T>) {

        let apiURL = request.url

        urlComponents.path = request.path
        if let parameters = request.parameters {
            urlComponents.setQueryItems(with: parameters)
        }
        
        guard let url = urlComponents.url?.absoluteString else { return }
        let compoundURL = apiURL + url
        guard let absoluteURL = URL(string: compoundURL) else { return }

        print(absoluteURL)

        dataTask = defaultSession.dataTask(with: absoluteURL) { [weak self] data, response, error in

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
