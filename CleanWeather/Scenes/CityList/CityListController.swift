//
//  CityListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresentable: SpinnerPresentable & AlertPresentable {
    func displayCity(_ citiesWeather: [CityWeatherDisplayable])
}

final class CityListController: SharedViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityListInteractor
    
    private var citiesWeatherDataSource = [CityWeatherDisplayable]()
    
    init(interactor: CityListInteractor) {
        self.interactor = interactor
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
        interactor.getFavouriteCities()
    }
    
    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        interactor.didPressAddButton()
    }
}

extension CityListController: CityListPresentable {
    
    func displayCity(_ citiesWeather: [CityWeatherDisplayable]) {
        citiesWeatherDataSource = citiesWeather
        tableView.reloadData(with: .automatic)
    }
}

extension CityListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeatherDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDataSource[indexPath.row])
        return cell
    }
}

extension CityListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = citiesWeatherDataSource[indexPath.row].id
        interactor.didSelectCityCell(id: id)
    }
}

private extension CityListController {

    private func setupTableView() {
        tableView.register(cellType: CityListTableViewCell.self)
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cleanWeather()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonPressed(_:)))
    }
}
