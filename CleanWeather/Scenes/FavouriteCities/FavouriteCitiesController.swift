//
//  FavouriteCitiesController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 04/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresentable: SpinnerPresentable & AlertPresentable {
    func displayCities(_ city: [FavouriteCitiesListDisplayable])
}

final class FavouriteCitiesController: SharedViewController {

    @IBOutlet private weak var citiesTableView: UITableView!

    private let interactor: FavouriteCitiesInteractor

    private var citiesDataSource = [FavouriteCitiesListDisplayable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        interactor.getCities()
    }

    init(interactor: FavouriteCitiesInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavouriteCitiesController: FavouriteCitiesPresentable {

    func displayCities(_ city: [FavouriteCitiesListDisplayable]) {
        citiesDataSource = city
        citiesTableView.reloadData()
    }
}

extension FavouriteCitiesController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: FavouriteCitiesTableViewCell.self, for: indexPath)
        cell.setup(with: citiesDataSource[indexPath.row])
        return cell
    }
}

extension FavouriteCitiesController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelectCity(name: citiesDataSource[indexPath.row].name)
    }
}

private extension FavouriteCitiesController {

    private func setupTableView() {
        citiesTableView.register(cellType: FavouriteCitiesTableViewCell.self)
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
    }

    private func setupNavigationBar() {
        title = R.string.localizable.favouriteCities()
    }
}
