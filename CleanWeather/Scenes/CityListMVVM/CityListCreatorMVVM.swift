//
//  CityListCreatorMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 09/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

struct CityListCreatorMVVM {

    func getController() -> CityListControllerMVVM {

        let userDefaults = UserDefaults.standard
        let jsonHelper = SerializerHelper.shared
        let repository = FavouriteCityRepositoryImpl(userDefaults: userDefaults, jsonHelper: jsonHelper)
        let networking = WeatherNetworkingImpl()
        let viewModel = CityListViewModelMVVM()
        let controller = CityListControllerMVVM(viewModel: viewModel)
        return controller
    }
}
