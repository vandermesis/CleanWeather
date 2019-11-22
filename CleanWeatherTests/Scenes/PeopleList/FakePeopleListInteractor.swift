//
//  FakePeopleListInteractor.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakePeopleListInteractor: PeopleListInteractor {

    var getPeopleCalled: Bool?
    var didSelectPersonCellPersonIdCalled: String?
    var changeBackgroundCalled: Bool?

    func getPeople() {
        getPeopleCalled = true
    }
    
    func didSelectPersonCell(personId: String) {
        didSelectPersonCellPersonIdCalled = personId
    }
    
    func changeBackground() {
        changeBackgroundCalled = true
    }

}
