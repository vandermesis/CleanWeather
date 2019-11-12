//
//  CitiesListCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CitiesListCreator {
    
    func getController() -> CitiesListController {
        
        let networking = WeatherNetworkingImpl()
        let worker = CitiesListWorkerImpl(networking: networking)
        let router = CitiesListRouterImpl()
        let presenter = CitiesListPresenterImpl()
        let interactor = CitiesListInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = CitiesListController(interactor: interactor)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
