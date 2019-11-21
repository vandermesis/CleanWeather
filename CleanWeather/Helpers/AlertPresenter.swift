//
//  AlertPresenter.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

protocol AlertPresenter {
    func presentAlert(title: String, message: String)
    func presentError(_ error: Error)
}
