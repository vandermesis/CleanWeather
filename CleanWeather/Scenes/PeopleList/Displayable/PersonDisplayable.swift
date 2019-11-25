//
//  PersonDisplayable.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

struct PersonDisplayable {
    
    let id: String
    let name: String
    let age: String
    let genderIconName: String
    
    static func convert(from object: Person) -> PersonDisplayable {
       
        let fullName =  "\(object.firstName) \(object.lastName)"
        let genderIcon = object.gender == .male ? "maleIcon" : "femaleIcon"
        let age = String(object.age)
        
        return PersonDisplayable(id: object.id,
                                 name: fullName,
                                 age: age,
                                 genderIconName: genderIcon)
    }
    
}
