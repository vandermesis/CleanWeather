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
        setupCellManagerDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFavouriteCities()
    }

    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        let favourtieCitiesController = FavouriteCitiesCreator().getController()
        navigationController?.pushViewController(favourtieCitiesController, animated: true)
    }
}

extension CityListControllerMVVM: CityListViewModelMVVMDelegate {

    func didUpdateFavouriteCitiesWeather(_ viewModel: CityListViewModelMVVM,
                                         citiesWeather: [CityWeather]) {
        cellManager.setup(with: citiesWeather)
        cityListTableView.reloadData()
    }

    func didFailWithError(error: Error) {
        presentAlert(title: R.string.localizable.sharedPresenterErrorTitle(),
                     message: error.userFriendlyMessage)
    }
}

extension CityListControllerMVVM: CityListCellManagerMVVMDelegate {

    func didSelectCityCell(city: CityWeather) {
        let cityForecastController = CityForecastCreator().getController(with: city)
        navigationController?.pushViewController(cityForecastController, animated: true)
    }
}

private extension CityListControllerMVVM {

    private func setupTableView() {
        cityListTableView.register(cellType: CityListTableViewCell.self)
        cityListTableView.delegate = cellManager
        cityListTableView.dataSource = cellManager
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

    private func setupCellManagerDelegate() {
        cellManager.delegate = self
    }
}
