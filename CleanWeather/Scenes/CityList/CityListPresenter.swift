//
//  CityListPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresenter {
    func displayCity(city: [CityWeather])
    func displayError(error: Error)
    func showSpinner(_ state: Bool)
}

final class CityListPresenterImpl {
    
    weak var controller: CityListPresentable?
    
}

extension CityListPresenterImpl: CityListPresenter {
    
    func displayCity(city: [CityWeather]) {
        <#code#>
    }
    
    func displayError(error: Error) {
        <#code#>
    }
    
    func showSpinner(_ state: Bool) {
        <#code#>
    }
    
    
}
