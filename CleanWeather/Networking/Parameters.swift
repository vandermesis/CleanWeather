//
//  Parameters.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct Parameters {

    static let queryItems = [URLQueryItem(name: "dataset", value: "worldcitiespop"),
                             URLQueryItem(name: "lang", value: "pl"),
                             URLQueryItem(name: "sort", value: "population"),
                             URLQueryItem(name: "facet", value: "country"),
                             URLQueryItem(name: "refine.country", value: "pl")]
}
