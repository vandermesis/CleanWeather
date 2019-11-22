//
//  PeopleListController.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol PeopleListPresentable: SpinnerPresentable & AlertPresentable {
    func displayPeople(_ people: [PersonDisplayable])
    func changeBackgroundColor(_ color: UIColor)
}

final class PeopleListController: SharedViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var changeBackgroundButton: UIButton!
    
    private var dataSource = [PersonDisplayable]()
    
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
        interactor.getPeople()
    }
    
    @IBAction private func tapChangeBackgroundAction(_ sender: UIButton) {
        interactor.changeBackground()
    }
    
}

extension PeopleListController: PeopleListPresentable {
    
    func displayPeople(_ people: [PersonDisplayable]) {
        dataSource = people
        tableView.reloadData()
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        self.tableView.backgroundColor = color
    }
}

extension PeopleListController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.imageView?.image = UIImage(named: dataSource[indexPath.row].genderIconName)
        cell.textLabel?.text = dataSource[indexPath.row].name
        return cell
    }
}

extension PeopleListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personId = dataSource[indexPath.row].id
        interactor.didSelectPersonCell(personId: personId)
    }
    
}
