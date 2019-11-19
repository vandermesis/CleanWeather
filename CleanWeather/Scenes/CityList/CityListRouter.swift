//
//  CityListRouter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListRouter {
    func navigateToCityDetails(id: String)
}

final class CityListRouterImpl {
    
    weak var controller: UIViewController?
    
}

extension CityListRouterImpl: CityListRouter {
    
    func navigateToCityDetails(id: String) {
        // TODO: Add cityDetailsController Creator code here
        let cityDetailsController = PeopleListCreator().getController()
        controller?.navigationController?.pushViewController(cityDetailsController, animated: true)
    }
}
