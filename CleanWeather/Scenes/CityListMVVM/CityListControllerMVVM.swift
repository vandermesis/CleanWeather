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

    private let viewModel: CityListViewModelMVVM

    private var citiesWeatherDataSource = [CityWeatherDisplayable]()

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
    }

    override func viewWillAppear(_ animated: Bool) {
//        viewModel.getFavouriteCites()
    }

    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
//        viewModel.didPressAddButton()
    }
}

extension CityListControllerMVVM: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeatherDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDataSource[indexPath.row])
        return cell
    }
}

extension CityListControllerMVVM: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelectCityCell()
    }
}

private extension CityListControllerMVVM {

    private func setupTableView() {
        cityListTableView.register(cellType: CityListTableViewCell.self)
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cityListTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonPressed(_:)))
    }
}
