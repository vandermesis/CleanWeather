//
//  FakePresenter.swift
//  CleanWeatherTests
//
//  Created by Patryk Średziński on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

class FakePresenter: SpinnerPresenter, AlertPresenter {

    var presentAlertTitleCalled: String?
    var presentAlertMessageCalled: String?
    var presentErrorCalled: Error?
    var toggleSpinnerStateCalled: Bool?
    
    func presentAlert(title: String, message: String) {
        presentAlertTitleCalled = title
        presentAlertMessageCalled = message
    }
    
    func presentError(_ error: Error) {
        presentErrorCalled = error
    }
    
    func toggleSpinner(_ state: Bool) {
        toggleSpinnerStateCalled = state
    }
    
}
