//
//  CityListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresentable: UIViewController {
    func displayCity(_ city: [CityWeatherDisplayable])
    func presentAlert(title: String, message: String)
    func showSpinner(_ state: Bool)
}

final class CityListController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityListInteractor
    
    private var dataSource = [CityWeatherDisplayable]()
    
    init(interactor: CityListInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getCity()
        
//        tableView.register(UINib(nibName: "CityListTableViewCell", bundle: nil), forCellReuseIdentifier: "CityCell")
    }
    
    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        print("\(#function)")
    }
}

extension CityListController: CityListPresentable {
    
    func displayCity(_ city: [CityWeatherDisplayable]) {
        dataSource = city
        tableView.reloadData()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func showSpinner(_ state: Bool) {
        let spinner = Spinner()
        if state {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            spinner.willMove(toParent: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParent()
        }
    }
}

extension CityListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Build proper cells and dequeue them
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.imageView?.image = UIImage(named: dataSource[indexPath.row].cityWeatherIcon.icon)
        cell.textLabel?.text = dataSource[indexPath.row].cityName
        cell.detailTextLabel?.text = dataSource[indexPath.row].cityTemp
        return cell
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityListTableViewCell else {
//            let cell = CityListTableViewCell(style: .default, reuseIdentifier: "CityCell")
//            return cell }
//        cell.cityNameLabel.text = dataSource[indexPath.row].cityName
//        cell.cityTempLabel.text = dataSource[indexPath.row].cityTemp
//        cell.cityWeatherSymbol.image = UIImage(systemName: dataSource[indexPath.row].cityWeatherIcon.icon)
    }
}

extension CityListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = dataSource[indexPath.row].cityName
        interactor.didSelectCityCell(city: name)
    }
}
