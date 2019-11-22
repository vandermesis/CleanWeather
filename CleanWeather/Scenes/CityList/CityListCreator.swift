//
//  CityListCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityListCreator {
    
    func getController() -> CityListController {
        
        let networking = WeatherNetworkingImpl()
        let worker = CityListWorkerImpl(networking: networking)
        let router = CityListRouterImpl()
        let presenter = CityListPresenterImpl<CityListController>()
        let interactor = CityListInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = CityListController(interactor: interactor)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
