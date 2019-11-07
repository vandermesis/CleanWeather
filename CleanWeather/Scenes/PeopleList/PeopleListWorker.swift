//
//  PeopleListWorker.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol PeopleListWorker {
    
}

final class PeopleListWorkerImpl: PeopleListWorker {
    
    private let networking: PeopleNetworking
    
    init(networking: PeopleNetworking) {
        self.networking = networking
    }
    
}
