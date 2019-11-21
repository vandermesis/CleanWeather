//
//  DoubleExtension.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

extension Double {
    
    var temperatureString: String {
        return "\(Int(self.rounded()))°"
    }
}
