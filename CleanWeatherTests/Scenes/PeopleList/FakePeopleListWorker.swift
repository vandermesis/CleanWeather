//
//  FakePeopleListWorker.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakePeopleListWorker: PeopleListWorker {
   
    var fetchPeopleCalled: Bool?
    var fetchPeopleCompletion: FetchPeopleCompletion?
    
    func fetchPeople(completion: FetchPeopleCompletion?) {
        fetchPeopleCalled = true
        fetchPeopleCompletion = completion
    }
    
}
