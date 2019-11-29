//
//  SpinnerController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 14/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

final class SpinnerController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
