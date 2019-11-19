//
//  CityDetailsController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityDetailsPresentable {
    
}

final class CityDetailsController: SharedViewController {
    
    private let interactor: CityDetailsInteractor
    
    init(interactor: CityDetailsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CityDetailsController: CityDetailsPresentable {
    
}
