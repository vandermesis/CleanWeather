//
//  CityListControllerMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 09/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

final class CityListControllerMVVM: SharedViewController {

    @IBOutlet private weak var cityListTableView: UITableView!

    private let cellManager: CityListCellManagerMVVM
    private let viewModel: CityListViewModelMVVM

    init(viewModel: CityListViewModelMVVM,
         cellManager: CityListCellManagerMVVM) {
        self.viewModel = viewModel
        self.cellManager = cellManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupViewModelDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        toogleSpinner(true)
        viewModel.getFavouriteCities()
    }

    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        let favourtieCitiesController = FavouriteCitiesCreator().getController()
        navigationController?.pushViewController(favourtieCitiesController, animated: true)
    }
}

extension CityListControllerMVVM: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.citiesWeather.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let citiesWeather = viewModel.citiesWeather
        return cellManager.buildCell(tableView: tableView,
                                     indexPath: indexPath,
                                     citiesWeather: citiesWeather)
    }
}

extension CityListControllerMVVM: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel.citiesWeather[indexPath.row]
        navigateToCityForecast(city: city)
    }
}

extension CityListControllerMVVM: CityListViewModelMVVMDelegate {

    func didUpdateFavouriteCitiesWeather() {
        toogleSpinner(false)
        cityListTableView.reloadData()
    }

    func didFailWithError(error: Error) {
        presentAlert(title: R.string.localizable.sharedPresenterErrorTitle(),
                     message: error.userFriendlyMessage)
    }
}

private extension CityListControllerMVVM {

    private func setupTableView() {
        cityListTableView.register(cellType: CityListTableViewCell.self)
        cityListTableView.delegate = self
        cityListTableView.dataSource = self
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cityListTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonPressed(_:)))
    }

    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }

    private func navigateToCityForecast(city: CityWeather) {
        let cityForecastController = CityForecastCreator().getController(with: city)
        navigationController?.pushViewController(cityForecastController, animated: true)
    }
}
