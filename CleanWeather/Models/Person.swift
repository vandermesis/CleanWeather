//
//  Person.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct Person: Codable {

    enum Gender: String {
        case male = "Male"
        case female = "Female"
    }
    
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
    let sex: String
    let email: String
    
    var gender: Gender {
        return Gender(rawValue: sex) ?? .male
    }
    
}
