//
//  SuperViewController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 16/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
    
    func presentSpinner(_ state: Bool) {
        let spinner = SpinnerController()
        
        if state {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
            
            //FIXME: To be removed after fix
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                spinner.willMove(toParent: nil)
                spinner.view.removeFromSuperview()
                spinner.removeFromParent()
            }
        } else {
            DispatchQueue.main.async {
                spinner.willMove(toParent: nil)
                spinner.view.removeFromSuperview()
                spinner.removeFromParent()
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
