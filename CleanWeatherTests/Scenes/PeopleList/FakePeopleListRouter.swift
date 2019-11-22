//
//  FakePeopleListRouter.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakePeopleListRouter: PeopleListRouter {
 
    var navigateToPersonDetailsPersonIdCalled: String?
    
    func navigateToPersonDetails(personId: String) {
        navigateToPersonDetailsPersonIdCalled = personId
    }
    
}
