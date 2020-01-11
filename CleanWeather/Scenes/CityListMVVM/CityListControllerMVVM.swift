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

    private var citiesWeatherDataSource = [CityWeather]()
    private var citiesWeatherDisplayableDataSource = [CityWeatherDisplayable]()

    private let viewModel: CityListViewModelMVVM

    init(viewModel: CityListViewModelMVVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFavouriteCities()
    }

    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        let favourtieCitiesController = FavouriteCitiesCreator().getController()
        navigationController?.pushViewController(favourtieCitiesController, animated: true)
    }
}

extension CityListControllerMVVM: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeatherDisplayableDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDisplayableDataSource[indexPath.row])
        return cell
    }
}

extension CityListControllerMVVM: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = citiesWeatherDataSource[indexPath.row]
        let cityForecastController = CityForecastCreator().getController(with: city)
        navigationController?.pushViewController(cityForecastController, animated: true)
    }
}

extension CityListControllerMVVM: CityListViewModelMVVMDelegate {

    func didUpdateFavouriteCitiesWeather(_ viewModel: CityListViewModelMVVM,
                                         citiesWeather: [CityWeather],
                                         citiesWeatherDisplayable: [CityWeatherDisplayable]) {
        citiesWeatherDataSource = citiesWeather
        citiesWeatherDisplayableDataSource = citiesWeatherDisplayable
        print(citiesWeatherDisplayableDataSource)
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

    private func setupViewModel() {
        viewModel.delegate = self
    }
}
