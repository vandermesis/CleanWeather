//
//  PeopleListPresenter.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
import Foundation

protocol PeopleListPresenter: SpinnerPresenter, AlertPresenter {
    func displayPeople(people: [Person])
    func changeBackgroundColor(_ color: UIColor)
}

final class PeopleListPresenterImpl<T: PeopleListPresentable>: SharedPresenter<T> {

}

extension PeopleListPresenterImpl: PeopleListPresenter {

    func displayPeople(people: [Person]) {
        let displayable = people.map { PersonDisplayable.convert(from: $0) }
        controller?.displayPeople(displayable)
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        controller?.changeBackgroundColor(color)
    }

}
