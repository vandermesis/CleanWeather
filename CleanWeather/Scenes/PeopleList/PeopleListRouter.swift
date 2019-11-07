//
//  PeopleListRouter.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol PeopleListRouter {
    func navigateToPersonDetails(personId: String)
}

final class PeopleListRouterImpl {

    weak var controller: UIViewController?
    
}

extension PeopleListRouterImpl: PeopleListRouter {
    
    func navigateToPersonDetails(personId: String) {
        // TODO: Add Next Controller Creator code here
        let nextController = UIViewController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
    
}
