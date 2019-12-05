//
//  CityDatabase.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityDatabase {
    func saveFavouriteCity(city: FavouriteCity)
    func loadFavouriteCities() -> [FavouriteCity]
}

final class CityDatabaseImpl: CityDatabase {

    var favouriteCities = [FavouriteCity]()

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    func saveFavouriteCity(city: FavouriteCity) {

        if !favouriteCities.contains(where: { $0.name == city.name }) {
            favouriteCities.append(city)
        } else {
            for record in favouriteCities where record.name == city.name {
                print("Unlike city")
                //FIXME: Why I can't assign to property: record is let constant?
//                record.favourite = false
            }
        }

        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(favouriteCities)
            if let filePath = dataFilePath {
                try data.write(to: filePath)
            }
        } catch {
            print("Error encoding \(error)")
        }
    }

    func loadFavouriteCities() -> [FavouriteCity] {
        if let filePath = dataFilePath {
            if let data = try? Data(contentsOf: filePath) {
                let decoder = PropertyListDecoder()
                do {
                    favouriteCities = try decoder.decode([FavouriteCity].self, from: data)
                } catch {
                    print("Error decoding \(error)")
                }
            }
        }
        return favouriteCities
    }
}
