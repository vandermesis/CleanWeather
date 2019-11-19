//
//  ErrorPresentable.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol SpinnerPresentable: UIViewController {
    
    //TODO: Rename this, we can hide spinner with 'presentSpinner' that's confusing, rename it to 'toggleSpinner'
    func presentSpinner(_ state: Bool)
    
}

extension SpinnerPresentable {
    
    //TODO: Rename this, we can hide spinner with 'presentSpinner' that's confusing, rename it to 'toggleSpinner'
    func presentSpinner(_ state: Bool) {
        if state {
            guard navigationController?.presentedViewController == nil else { return }
            let spinner = SpinnerController()
            navigationController?.present(spinner, animated: false, completion: nil)
        } else {
            guard let spinner = navigationController?.presentedViewController as? SpinnerController else { return }
            spinner.dismiss(animated: false, completion: nil)
        }
    }
    
}
