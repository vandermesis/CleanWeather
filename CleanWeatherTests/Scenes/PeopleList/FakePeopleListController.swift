//
//  FakePeopleListController.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
@testable import CleanWeather

final class FakePeopleListController: UIViewController, PeopleListPresentable {

    var displayPeopleCalled: [PersonDisplayable]?
    var changeBackgroundColorCalled: UIColor?

    func displayPeople(_ people: [PersonDisplayable]) {
        displayPeopleCalled = people
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        changeBackgroundColorCalled = color
    }
    
}
