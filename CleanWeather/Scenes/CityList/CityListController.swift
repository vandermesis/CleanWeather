//
//  CityListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresentable: UIViewController {
    func displayCity(_ citiesWeather: [CityWeatherDisplayable])
    func presentAlert(title: String, message: String)
    func showSpinner(_ state: Bool)
}

final class CityListController: UIViewController {
    
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
    }
    
    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: Implement add new city functionality
        print("\(#function)")
    }
    
    func setupTableView() {
        tableView.register(cellType: CityListTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CityListController: CityListPresentable {
    
    func displayCity(_ citiesWeather: [CityWeatherDisplayable]) {
        citiesWeahterDataSource = citiesWeather
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
            
            //FIXME: To be removed after fix
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                spinner.willMove(toParent: nil)
                spinner.view.removeFromSuperview()
                spinner.removeFromParent()
            }
        } else {
            DispatchQueue.main.async {
                spinner.willMove(toParent: nil)
                spinner.view.removeFromSuperview()
                spinner.removeFromParent()
            }
        }
    }
}

extension CityListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeahterDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: CityListTableViewCell.self, for: indexPath)
        cell.setupWith(cityName: citiesWeahterDataSource[indexPath.row].cityName,
                       cityTemp: citiesWeahterDataSource[indexPath.row].cityTemp,
                       weatherSymbol: citiesWeahterDataSource[indexPath.row].cityWeatherIcon.icon)
        return cell
    }
}

extension CityListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = citiesWeahterDataSource[indexPath.row].id
        interactor.didSelectCityCell(id: id)
    }
}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

public extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell!") }
        return cell
    }
}
