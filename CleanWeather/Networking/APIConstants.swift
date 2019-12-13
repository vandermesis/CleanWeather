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
    static let odsQueryItems = [URLQueryItem(name: "dataset", value: "worldcitiespop"),
                                     URLQueryItem(name: "lang", value: "pl"),
                                     URLQueryItem(name: "sort", value: "population"),
                                     URLQueryItem(name: "facet", value: "country"),
                                     URLQueryItem(name: "refine.country", value: "pl")]

    //DarkSky
    static let dsURL =  "https://api.darksky.net"
    static let dsApiKey = ""

}
