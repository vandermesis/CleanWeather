//
//  FakePeopleListPresenter.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
@testable import CleanWeather

final class FakePeopleListPresenter: FakePresenter, PeopleListPresenter {
 
    var changeBackgroundColorCalled: UIColor?
    var displayPeopleCalled: [Person]?
    
    func changeBackgroundColor(_ color: UIColor) {
        changeBackgroundColorCalled = color
    }
    
    func displayPeople(people: [Person]) {
        displayPeopleCalled = people
    }
    
}
