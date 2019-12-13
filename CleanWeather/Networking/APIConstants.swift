//
//  APIConstants.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct APIConstants {

    //OpenDataSoft
    static let odsURL = "public.opendatasoft.com"
    static let odsPath = "/api/records/1.0/search/"

    //FIXME: To be removed after proper setup
    static let odsQueryParams: [String: String] = [
        "dataset": "worldcitiespop",
        "lang": "pl",
        "sort": "population",
        "facet": "country",
        "refine.country": "pl"
    ]

    //DarkSky
    static let dsURL =  "https://api.darksky.net"
    static let dsApiKey = ""

}
