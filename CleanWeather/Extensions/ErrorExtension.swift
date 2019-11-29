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

struct UnitTestError: Error {}

extension Error {
    var userFriendlyMessage: String {
        if self is DecodingError {
            return R.string.localizable.decodingError()
        } else if let appError = self as? AppError {
            return appError.message
        } else {
            return R.string.localizable.unknownError()
        }
    }
}
