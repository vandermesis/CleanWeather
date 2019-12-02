//
//  CityHistoricalController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresentable: SpinnerPresentable & AlertPresentable {
    func displayCityDetails(_ cityDetails: CityCurrentDisplayable)
    func displayCityHistorical(_ cityHistorical: CityHistoricalDisplayable)
}

final class CityHistoricalController: SharedViewController {

    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var dateTextField: UITextField!

    private let interactor: CityHistoricalInteractor

    private let dateFormatter = DateFormatter()

    init(interactor: CityHistoricalInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("CityHistoricalController DEALLOCATED")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupDatePicker()
        interactor.getCityDetails()
    }

    @IBAction private func doneButtonPressed(_ sender: UIButton) {
        guard let dateString = dateTextField.text else { return }
        guard let dateFromString = dateFormatter.date(from: dateString) else { return }
        interactor.getCityHistoricalWeather(date: dateFromString)
    }

    private func setupNavigationBar() {
        title = R.string.localizable.timeMachine()
    }
}

extension CityHistoricalController: CityHistoricalPresentable {

    func displayCityDetails(_ cityDetails: CityCurrentDisplayable) {
        cityLabel.text = cityDetails.name
        tempLabel.text = cityDetails.temp
        weatherSymbol.image = UIImage(systemName: cityDetails.symbol.icon)
    }

    func displayCityHistorical(_ cityHistorical: CityHistoricalDisplayable) {
        cityLabel.text = cityHistorical.name
        tempLabel.text = cityHistorical.temp
        weatherSymbol.image = UIImage(systemName: cityHistorical.symbol.icon)
    }
}

private extension CityHistoricalController {

    func setupDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .systemBackground
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        dateTextField.inputView = datePicker
    }

    @objc func datePickerChanged(_ sender: UIDatePicker) {
        dateFormatter.dateStyle = .long
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
}
