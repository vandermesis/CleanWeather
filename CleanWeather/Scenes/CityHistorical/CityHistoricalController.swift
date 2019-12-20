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
    func displayFormattedDate(_ date: String)
}

final class CityHistoricalController: SharedViewController {

    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var dateTextField: UITextField!

    private let interactor: CityHistoricalInteractor

    private var date: Date?

    init(interactor: CityHistoricalInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupDatePicker()
        setupTextField()
        interactor.getCityDetails()
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

    func displayFormattedDate(_ date: String) {
        dateTextField.text = date
    }
}

extension CityHistoricalController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let date = date else { return }
        interactor.getCityHistoricalWeather(date: date)
    }
}

private extension CityHistoricalController {

    private func setupTextField() {
        dateTextField.delegate = self
    }

    private func setupNavigationBar() {
        title = R.string.localizable.timeMachine()
    }

    private func setupDatePicker() {
        let bar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(hideKeyboard))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

        bar.items = [flexible, doneButton]
        bar.sizeToFit()

        dateTextField.inputAccessoryView = bar

        let datePicker = UIDatePicker()

        datePicker.datePickerMode = .date
        datePicker.maximumDate = .init(timeIntervalSince1970: .weekInterval)
        datePicker.backgroundColor = .systemBackground
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)

        dateTextField.inputView = datePicker
    }

    @objc private func datePickerChanged(_ sender: UIDatePicker) {
        date = sender.date
        interactor.didSelectDate(date: sender.date)
    }

    @objc private func hideKeyboard() {
        dateTextField.resignFirstResponder()
    }
}
