//
//  DateFormatterHelper.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 04/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case full = "dd.MM.yyyy HH:mm"
    case long = "dd MMMM yyyy"
    case apiFormat = "yyyy-MM-DD'T'HH:mm:ss"
}

final class DateFormatterHelper {

    static let shared = DateFormatterHelper()

    private let formatter: DateFormatter

    private init() {
        formatter = DateFormatter()
    }

    func formatToString(date: Date, format: DateFormat) -> String {
        formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
    }

    func formatToDate(string: String, format: DateFormat) -> Date? {
        formatter.dateFormat = format.rawValue
        return formatter.date(from: string)
    }
}
