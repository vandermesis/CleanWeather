//
//  CityListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresentable: UIViewController {
    
}

final class CityListController: UIViewController, CityListPresentable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityListInteractor
    
    private let datasource = [CityDisplayable]()
    
    init(interactor: CityListInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func addButtonPressed(_ sender: UIBarButtonItem) {
        print("\(#function)")
    }
}
