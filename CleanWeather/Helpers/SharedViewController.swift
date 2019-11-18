//
//  SharedViewController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 16/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController {
    
    func presentSpinner(_ state: Bool) {
        if state {
            let spinner = SpinnerController()
            guard navigationController?.presentedViewController == nil else { return }
            navigationController?.present(spinner, animated: false, completion: nil)
        } else {
            if let spinner = navigationController?.presentedViewController as? SpinnerController {
                spinner.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil)
        alert.addAction(action)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
