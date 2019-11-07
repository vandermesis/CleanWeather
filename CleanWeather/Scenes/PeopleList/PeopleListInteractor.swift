//
//  PeopleListInteractor.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol PeopleListInteractor {
    
}

final class PeopleListInteractorImpl: PeopleListInteractor {

    private let presenter: PeopleListPresenter
    private let worker: PeopleListWorker
    private let router: PeopleListRouter
    
    init(presenter: PeopleListPresenter,
         worker: PeopleListWorker,
         router: PeopleListRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
    
}
