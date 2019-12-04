//
//  SharedTextField.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SharedTextField: UITextField {

    var enableLongPressActions = false

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return enableLongPressActions
    }
}
