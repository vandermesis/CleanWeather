//
//  SearchControllerHelper.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 29/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

final class SearchControllerHelper {

    static let shared = SearchControllerHelper().searchController

    private let searchController: UISearchController

    private init(searchResultsController: UIViewController? = nil) {
        self.searchController = UISearchController(searchResultsController: searchResultsController)
    }
}
