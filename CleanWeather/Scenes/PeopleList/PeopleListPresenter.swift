//
//  PeopleListPresenter.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
import Foundation

protocol PeopleListPresenter {
    func displayPeople(people: [Person])
    func displayError(error: Error)
    func updateSpinner(state: Bool)
    func changeBackgroundColor(_ color: UIColor)
}

final class PeopleListPresenterImpl {

    weak var controller: PeopleListPresentable?

}

extension PeopleListPresenterImpl: PeopleListPresenter {

    func displayPeople(people: [Person]) {
        let displayable = people.map { PersonDisplayable.convert(from: $0) }
        controller?.displayPeople(displayable)
    }
    
    func displayError(error: Error) {
        controller?.presentAlert(title: "ERROR", body: "API ERROR: \(error)")
    }
    
    func updateSpinner(state: Bool) {
        controller?.updateSpinner(state: state)
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        controller?.changeBackgroundColor(color)
    }

}
