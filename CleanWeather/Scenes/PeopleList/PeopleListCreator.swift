//
//  PeopleListCreator.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct PeopleListCreator {

    func getController() -> PeopleListController {
      
        let networking = PeopleNetworkingImpl()
        let worker = PeopleListWorkerImpl(networking: networking)
        let router = PeopleListRouterImpl()
        let presenter = PeopleListPresenterImpl()
        let interactor = PeopleListInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = PeopleListController(interactor: interactor)
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
