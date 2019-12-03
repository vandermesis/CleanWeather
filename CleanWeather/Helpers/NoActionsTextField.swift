//
//  NoActionsTextField.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class NoActionsTextField: UITextField {

    var enableLongPressActions = false

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return enableLongPressActions
    }
}
