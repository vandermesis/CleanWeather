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

enum SerializerError: Error {
    case jsonDecodingError
    case jsonEncodingError
}

enum UserDefaultsError: Error {
    case readUserDefaults
    case writeUserDefaults
}

extension Error {
    var userFriendlyMessage: String {
        if let appError = self as? AppError {
            return appError.message
        } else if self is SerializerError {
            return R.string.localizable.serializerError()
        } else if self is UserDefaultsError {
            return R.string.localizable.userDefaultsError()
        } else {
            return R.string.localizable.unknownError()
        }
    }
}
