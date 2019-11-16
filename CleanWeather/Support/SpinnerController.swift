//
//  SpinnerController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 14/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SpinnerController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
