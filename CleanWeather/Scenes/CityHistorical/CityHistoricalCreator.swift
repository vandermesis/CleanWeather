//
//  CityHistoricalCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityHistoricalCreator {

    func getController(with cityDetails: CityWeather) -> CityHistoricalController {

        let networking = WeatherNetworkingImpl()
        let worker = CityHistoricalWorkerImpl(networking: networking)
        let router = CityHistoricalRouterImpl()
        let presenter = CityHistoricalPresenterImpl<CityHistoricalController>()
        let interactor = CityHistoricalInteractorImpl(cityDetails: cityDetails,
                                                      presenter: presenter,
                                                      worker: worker,
                                                      router: router)
        let controller = CityHistoricalController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
