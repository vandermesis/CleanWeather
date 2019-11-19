//
//  CityDetailsWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityDetailsWorker {
    
}

final class CityDetailsWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityDetailsWorkerImpl: CityDetailsWorker {
    
}
