//
//  DateFormatterSingleton.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 04/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

class DateFormatterSingleton {

    static var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }

    func formatToString(date: Date) -> String {
        return DateFormatterSingleton.formatter.string(from: date)
    }
}
