//
//  CollectionViewExtension.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }

    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    func dequeue<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Failed to dequeue collection view cell!")
        }
        return cell
    }
}
