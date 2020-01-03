//
//  NSObjectExtension.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
