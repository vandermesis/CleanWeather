//
//  CityDetailsInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityDetailsInteractor {
    
}

final class CityDetailsInteractorImpl {
    
    private let presenter: CityDetailsPresenter
    private let worker: CityDetailsWorker
    private let router: CityDetailsRouter
    
    init(presenter: CityDetailsPresenter,
         worker: CityDetailsWorker,
         router: CityDetailsRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension CityDetailsInteractorImpl: CityDetailsInteractor {
    
}
