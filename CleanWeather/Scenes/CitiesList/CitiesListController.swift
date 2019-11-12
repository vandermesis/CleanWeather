//
//  CitiesListController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CitiesListPresentable: UIViewController {
    
}

final class CitiesListController: UIViewController, CitiesListPresentable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CitiesListInteractor
    
    init(interactor: CitiesListInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init \(coder) has not been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
