//
//  CityListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresentable: SuperViewController {
    func displayCity(_ citiesWeather: [CityWeatherDisplayable])
}

final class CityListController: SuperViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityListInteractor
    
    private var citiesWeahterDataSource = [CityWeatherDisplayable]()
    
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
        interactor.getCity()
        title = "Cities"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonPressed(_:)))
    }
    
    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: Implement add new city functionality
        print("\(#function)")
    }
    
    func setupTableView() {
        tableView.register(cellType: CityListTableViewCell.self)
    }
}

extension CityListController: CityListPresentable {
    
    func displayCity(_ citiesWeather: [CityWeatherDisplayable]) {
        citiesWeahterDataSource = citiesWeather
        tableView.reloadData()
    }
}

extension CityListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeahterDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setupWith(cityWeatherDisplayable: citiesWeahterDataSource[indexPath.row])
        return cell
    }
}

extension CityListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = citiesWeahterDataSource[indexPath.row].id
        interactor.didSelectCityCell(id: id)
    }
}
