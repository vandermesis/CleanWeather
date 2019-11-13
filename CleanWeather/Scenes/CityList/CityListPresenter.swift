//
//  CityListPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresenter {
    
}

final class CityListPresenterImpl: CityListPresenter {
    
    weak var controller: CityListPresentable?
    
}
