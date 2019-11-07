//
//  PeopleNetworking.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchPeopleCompletion = (Result<[Person], Error>) -> Void

protocol PeopleNetworking {
    func fetchPeople(completion: FetchPeopleCompletion?)
}

final class PeopleNetworkingImpl: PeopleNetworking {

    func fetchPeople(completion: FetchPeopleCompletion?) {
        
        //TODO: Build proper networking and remove these mocked values
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            completion?(Result.success([
                Person(id: "fb812bd3-8bbd-47cc-92f5-fb6205bf0ccd", firstName: "Bernadette", lastName: "Bransden", age: 23, sex: "Female", email: "bbransden0@army.mil"),
                Person(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", firstName: "Rayshell", lastName: "Mangon", age: 24, sex: "Female", email: "rmangon1@google.fr"),
                Person(id: "05197501-e7b0-4bfd-84e0-e07038270f2d", firstName: "Son", lastName: "Diboll", age: 32, sex: "Male", email: "sdiboll2@nymag.com"),
                Person(id: "00b66ad7-e6ab-47e3-bbef-9e0ee00952c6", firstName: "Cornela", lastName: "Form", age: 42, sex: "Female", email: "cform3@shinystat.com"),
                Person(id: "755c1db5-436c-4b2a-a7a8-e1908d8f3692", firstName: "Dael", lastName: "Vignaux", age: 41, sex: "Male", email: "dvignaux4@ask.com"),
                Person(id: "ec9c3b2e-7ac2-445d-8c66-bb5803801046", firstName: "Natassia", lastName: "Risbrough", age: 47, sex: "Female", email: "nrisbrough5@t.co"),
                Person(id: "d945c803-e890-4440-bd92-c34f3c993363", firstName: "Karlan", lastName: "Claisse", age: 21, sex: "Male", email: "kclaisse6@si.edu"),
                Person(id: "54797234-dbd4-430b-a9f0-9a0a6a23852e", firstName: "Noby", lastName: "Maidlow", age: 25, sex: "Male", email: "nmaidlow7@forbes.com"),
                Person(id: "0ee83b7b-bb3e-4f06-a3f3-0aac5eea76aa", firstName: "Juieta", lastName: "Heis", age: 37, sex: "Female", email: "jheis8@msu.edu"),
                Person(id: "0ac78e00-84cd-407c-9edf-242d2bff99b9", firstName: "Kory", lastName: "Limbourne", age: 41, sex: "Male", email: "klimbourne9@hp.com")
            ]))
        }
        
    }
    
}
