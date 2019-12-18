//
//  BaseNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

class BaseNetworking {

    var client: APIClient

    init(client: APIClient = APIClient()) {
        self.client = client
    }
}
