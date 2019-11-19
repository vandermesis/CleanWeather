//
//  AlertPresentable.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol AlertPresentable: UIViewController {
    func presentAlert(title: String, message: String)
}

extension AlertPresentable {
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil)
        alert.addAction(action)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
