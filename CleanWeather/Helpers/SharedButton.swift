//
//  SharedButton.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 11/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

final class SharedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.layer.cornerRadius = 20
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 7
        self.layer.shadowColor = UIColor.systemRed.cgColor
    }
}
