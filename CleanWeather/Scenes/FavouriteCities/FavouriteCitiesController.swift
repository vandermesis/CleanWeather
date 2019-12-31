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
    @IBOutlet private weak var saveButton: UIButton!

    private var citiesDataSource = [FavouriteCitiesListDisplayable]()
    private var userSearch: String = ""
    private var isFavourite: Bool = false
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }

    private let interactor: FavouriteCitiesInteractor
    private let searchController: UISearchController

    init(interactor: FavouriteCitiesInteractor,
         searchController: UISearchController) {
        self.interactor = interactor
        self.searchController = searchController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupSearchController()
        interactor.getCities()
    }

    @IBAction private func saveButtonPressed(_ sender: UIButton) {
        interactor.didPressSaveButton()
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
        interactor.didSelectCity(id: citiesDataSource[indexPath.row].id,
                                 userSearch: userSearch,
                                 filteringState: isFiltering)
    }
}

extension FavouriteCitiesController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let userSearch = searchBar.text else { return }
        self.userSearch = userSearch
        interactor.searchFavouriteCities(cityName: userSearch, filteringState: isFiltering, favouriteState: isFavourite)
    }
}

extension FavouriteCitiesController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        isFavourite = selectedScope == 1 ? true : false
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

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = R.string.localizable.searchCities()
        searchController.searchBar.scopeButtonTitles = [R.string.localizable.all(), R.string.localizable.favourites()]
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}
