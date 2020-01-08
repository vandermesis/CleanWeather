//
//  CityForecastCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityForecastCreator {
    
    func getController(with cityDetails: CityWeather) -> CityForecastController {

        let cellManager = CellManager()
        let networking = WeatherNetworkingImpl()
        let worker = CityForecastWorkerImpl(networking: networking)
        let router = CityForecastRouterImpl()
        let presenter = CityForecastPresenterImpl<CityForecastController>()
        let interactor = CityForecastInteractorImpl(cityDetails: cityDetails,
                                                    presenter: presenter,
                                                    worker: worker,
                                                    router: router)
        let controller = CityForecastController(interactor: interactor, cellManager: cellManager)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
