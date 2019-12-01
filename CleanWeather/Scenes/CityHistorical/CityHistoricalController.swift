//
//  CityHistoricalController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresentable: SpinnerPresentable & AlertPresentable {

}

final class CityHistoricalController: SharedViewController {

    @IBOutlet private weak var cityLable: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!

    private let interactor: CityHistorialInteractor

    init(interactor: CityHistorialInteractor) {
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

    }

    @IBAction private func datePickerChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }

}

extension CityHistoricalController: CityHistoricalPresentable {
    
}
