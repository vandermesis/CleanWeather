//
//  PeopleListController.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol PeopleListPresentable: UIViewController {
    
}

final class PeopleListController: UIViewController {

    private let interactor: PeopleListInteractor
    
    init(interactor: PeopleListInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension PeopleListController: PeopleListPresentable {
    
}
