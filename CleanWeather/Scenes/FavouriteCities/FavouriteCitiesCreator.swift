//
//  FavouriteCitiesCreator.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

struct FavouriteCitiesCreator {

    func getController() -> FavouriteCitiesController {

        let networking = WeatherNetworkingImpl()
        let database = CityDatabaseImpl()
        let worker = FavouriteCitiesWorkerImpl(networking: networking, database: database)
        let router = FavouriteCitiesRouterImpl()
        let presenter = FavouriteCitiesPresenterImpl<FavouriteCitiesController>()
        let interactor = FavouriteCitiesInteractorImpl(presenter: presenter,
                                                       worker: worker,
                                                       router: router)
        let controller = FavouriteCitiesController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
