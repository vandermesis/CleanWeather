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

        let networking = WeatherNetworkingImpl()
        let userDefaults = UserDefaults.standard
        let jsonHelper = SerializerHelper.shared
        let repository = FavouriteCityRepositoryImpl(userDefaults: userDefaults, jsonHelper: jsonHelper)
        let viewModel = CityListViewModelMVVM(networking: networking, repository: repository)
        let controller = CityListControllerMVVM(viewModel: viewModel)
        return controller
    }
}
