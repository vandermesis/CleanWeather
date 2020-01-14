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

        let dateFormatter = DateFormatterHelper.shared
        let networking = WeatherNetworkingImpl()
        let worker = CityHistoricalWorkerImpl(networking: networking)
        let presenter = CityHistoricalPresenterImpl<CityHistoricalController>(dateFormatter: dateFormatter)
        let interactor = CityHistoricalInteractorImpl(cityDetails: cityDetails,
                                                      presenter: presenter,
                                                      worker: worker)
        let controller = CityHistoricalController(interactor: interactor)

        presenter.controller = controller

        return controller
    }
}
