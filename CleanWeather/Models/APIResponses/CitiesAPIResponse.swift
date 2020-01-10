//
//  CitiesAPIResponse.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 14/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CitiesAPIResponse: Codable, Equatable {

    let records: [Record]

    struct Record: Codable, Equatable {

        let recordid: String
        let fields: Field

        struct Field: Codable, Equatable {

            let accentcity: String
            let longitude: Double
            let latitude: Double
        }
    }
}
