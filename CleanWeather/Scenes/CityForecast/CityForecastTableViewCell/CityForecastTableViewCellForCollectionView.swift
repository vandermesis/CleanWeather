//
//  CityForecastTableViewCellForCollectionView.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

class CityForecastTableViewCellForCollectionView: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!

    private var hourlyForecastDataSource = [CityHourlyForecastListDisplayable]()

    override func awakeFromNib() {
        setupCollectionView()
    }

    func setup(dataSource: [CityHourlyForecastListDisplayable]) {
        hourlyForecastDataSource = dataSource
    }
}

extension CityForecastTableViewCellForCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyForecastDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(with: CityForecastCollectionViewCell.self, for: indexPath)
        cell.setup(with: hourlyForecastDataSource[indexPath.row])
        return cell
    }
}

extension CityForecastTableViewCellForCollectionView {

    private func setupCollectionView() {
        collectionView.register(cellType: CityForecastCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}
