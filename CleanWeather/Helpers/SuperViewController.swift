//
//  SuperViewController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 16/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
    
    let spinner = SpinnerController()
    
    func presentSpinner(_ state: Bool) {
        if state {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            DispatchQueue.main.async {
                self.spinner.willMove(toParent: nil)
                self.spinner.view.removeFromSuperview()
                self.spinner.removeFromParent()
            }
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
