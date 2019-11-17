//
//  ErrorExtension.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 18/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct AppError: Error {
    let message: String
}

extension Error {
    var userFriendlyMessage: String {
        if self is DecodingError {
            return "Docoding Error"
        } else if let appError = self as? AppError {
            return appError.message
        }
        return "Unknown error"
    }
}
