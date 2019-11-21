//
//  CityForecastCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityForecastCreator {
    
    func getController(with passedCityWeather: CityWeather) -> CityForecastController {
        
        let passedData = passedCityWeather
        let networking = WeatherNetworkingImpl()
        let worker = CityForecastWorkerImpl(networking: networking)
        let router = CityDetailsRouterImpl()
        let presenter = CityForecastPresenterImpl()
        let interactor = CityForecastInteractorImpl(presenter: presenter, worker: worker, router: router, passedData: passedData)
        let controller = CityForecastController(interactor: interactor)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
