//
//  CityDetailsPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityDetailsPresenter: SpinnerPresenter, AlertPresenter {
    
}

final class CityDetailsPresenterImpl: SharedPresenter<CityDetailsController> {
    
}

extension CityDetailsPresenterImpl: CityDetailsPresenter {
    
}
