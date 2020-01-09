//
//  CityListCreatorMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 09/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

struct CityListCreatorsMVVM {

    func getController() -> CityListControllerMVVM {

        let userDefaults = UserDefaults.standard
        let jsonHelper = SerializerHelper.shared
        let repository = FavouriteCityRepositoryImpl(userDefaults: userDefaults, jsonHelper: jsonHelper)
        let networking = WeatherNetworkingImpl()
        let controller = CityListControllerMVVM()
        return controller
    }
}
