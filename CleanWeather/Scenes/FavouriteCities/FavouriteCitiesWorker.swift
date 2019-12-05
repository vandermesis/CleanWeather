//
//  FavouriteCitiesWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol FavouriteCitiesWorker {

}

final class FavouriteCitiesWorkerImpl {

    private let networking: WeatherNetworking

    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension FavouriteCitiesWorkerImpl: FavouriteCitiesWorker {
    
}
