//
//  FavouriteCitiesController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 04/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresentable: SpinnerPresentable & AlertPresentable {

}

final class FavouriteCitiesController: SharedViewController {

    @IBOutlet private weak var citiesTableView: UITableView!

    private let interactor: FavouriteCitiesInteractor

    private var citiesDataSource = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(interactor: FavouriteCitiesInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("FavouriteCitiesController DEALLOCATED")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavouriteCitiesController: FavouriteCitiesPresentable {
    
}
