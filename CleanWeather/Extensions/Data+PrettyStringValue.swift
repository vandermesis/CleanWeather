//
//  Data+PrettyStringValue.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 18/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

extension Data {

    var stringValue: String? {
        return String(data: self, encoding: .utf8)
    }

    var prettyStringValue: String? {
        if let dictionaryValue = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
            let dataValue = try? JSONSerialization.data(withJSONObject: dictionaryValue, options: .prettyPrinted),
            let stringValue = dataValue.stringValue {
            return stringValue
        }
        guard let stringValue = stringValue else { return nil }
        return stringValue
    }
}
