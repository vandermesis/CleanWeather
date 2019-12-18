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

struct APIError: Error {
    let statusCode: Int
    let data: Data?
}

struct InvalidURLError: Error {}

struct MissingAPIResponse: Error {}

struct MissingAPIData: Error {}

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
        } else if self is APIError {
            return R.string.localizable.apiError()
        } else if self is InvalidURLError {
            return R.string.localizable.invalidURL()
        } else if self is MissingAPIResponse {
            return R.string.localizable.missingApiResponse()
        } else if self is MissingAPIData {
            return R.string.localizable.missingApiData()
        } else if self is SerializerError {
            return R.string.localizable.serializerError()
        } else if self is UserDefaultsError {
            return R.string.localizable.userDefaultsError()
        } else {
            return R.string.localizable.unknownError()
        }
    }

    var developerFriendlyMessage: String {
        if let apiError = self as? APIError {
            print("API responded with statusCode: \(apiError.statusCode), data: \(String(describing: apiError.data))")
            return R.string.localizable.apiError()
        } else {
            print(String(describing: self))
            return R.string.localizable.unknownError()
        }
    }
}
