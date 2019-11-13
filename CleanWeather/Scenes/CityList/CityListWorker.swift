//
//  CityListWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityListWorker {
    
}

final class CityListWorkerImpl: CityListWorker {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}
