//
//  PeopleListInteractor.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
import Foundation

protocol PeopleListInteractor {
    func getPeople()
    func didSelectPersonCell(personId: String)
    func changeBackground()
}

final class PeopleListInteractorImpl {

    private var people = [Person]()
    
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

extension PeopleListInteractorImpl: PeopleListInteractor {
    
    func getPeople() {
        presenter.toggleSpinner(true)
        worker.fetchPeople { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let people):
                self?.people = people
                self?.presenter.displayPeople(people: people)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func didSelectPersonCell(personId: String) {
        router.navigateToPersonDetails(personId: personId)
    }
    
    func changeBackground() {
        if people.isEmpty {
            presenter.changeBackgroundColor(.red)
        } else {
            presenter.changeBackgroundColor(.blue)
        }
    }
    
}
