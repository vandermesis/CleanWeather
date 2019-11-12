//
//  CitiesListInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CitiesListInteractor {
    
}

final class CitiesListInteractorImpl: CitiesListInteractor {
    
    private let presenter: CitiesListPresenter
    private let worker: CitiesListWorker
    private let router: CitiesListRouter
    
    init(presenter: CitiesListPresenter,
         worker: CitiesListWorker,
         router: CitiesListRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}
