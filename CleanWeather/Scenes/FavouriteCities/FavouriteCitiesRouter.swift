//
//  FavouriteCitiesRouter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesRouter {
    func navigateBackToCityList()
}

final class FavouriteCitiesRouterImpl {

    weak var controller: UIViewController?
}

extension FavouriteCitiesRouterImpl: FavouriteCitiesRouter {

    func navigateBackToCityList() {
        guard let controllerToPopTo = controller?.navigationController?.viewControllers.first(where: { $0 is CityListController }) else { return }
        controller?.navigationController?.popToViewController(controllerToPopTo, animated: true)
    }
}
