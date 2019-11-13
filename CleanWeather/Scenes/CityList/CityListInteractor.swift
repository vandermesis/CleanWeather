//
//  CityListInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityListInteractor {
    
}

final class CityListInteractorImpl: CityListInteractor {
    
    private let presenter: CityListPresenter
    private let worker: CityListWorker
    private let router: CityListRouter
    
    init(presenter: CityListPresenter,
         worker: CityListWorker,
         router: CityListRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}
