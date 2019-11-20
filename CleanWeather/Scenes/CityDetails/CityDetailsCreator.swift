//
//  CityDetailsCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityDetailsCreator {
    
    func getController(with passedCityWeather: CityWeather) -> CityDetailsController {
        
        let passedData = passedCityWeather
        let networking = WeatherNetworkingImpl()
        let worker = CityDetailsWorkerImpl(networking: networking)
        let router = CityDetailsRouterImpl()
        let presenter = CityDetailsPresenterImpl()
        let interactor = CityDetailsInteractorImpl(presenter: presenter, worker: worker, router: router, passedData: passedData)
        let controller = CityDetailsController(interactor: interactor)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
