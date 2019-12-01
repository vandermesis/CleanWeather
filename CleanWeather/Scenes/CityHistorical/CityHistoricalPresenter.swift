//
//  CityHistoricalPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresenter: SpinnerPresenter, AlertPresenter {

}

final class CityHistoricalPresenterImpl<T: CityHistoricalPresentable>: SharedPresenter<T> {

}

extension CityHistoricalPresenterImpl: CityHistoricalPresenter {

}
