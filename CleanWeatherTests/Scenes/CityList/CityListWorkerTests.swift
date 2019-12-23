//
//  CityListWorkerTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityListWorkerTests: QuickSpec {

    override func spec() {

        var networking: FakeWeatherNetworking!
        var repository: FakeFavouriteCityRepository!
        var worker: CityListWorkerImpl!

        beforeEach {
            networking = FakeWeatherNetworking()
            repository = FakeFavouriteCityRepository()
            worker = CityListWorkerImpl(networking: networking, repository: repository)
        }

        describe("fetching favourite cities") {

            var receivedFavouriteCities: [City]?
            var receivedError: Error?

            beforeEach {
                worker.fetchFavouriteCities { result in
                    switch result {
                    case .success(let favouriteCities):
                        receivedFavouriteCities = favouriteCities
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedFavouriteCities = nil
                receivedError = nil
            }

            it("should call repository to fetch favourite cities") {
                expect(repository.fetchFavouriteCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    repository.fetchFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                }

                it("should return favourite cities") {
                    expect(receivedFavouriteCities).notTo(beNil())
                    expect(receivedFavouriteCities?.count).to(equal(Mock.favouriteCities.count))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    repository.fetchFavouriteCitiesCompletion?(.failure(UnitTestError()))
                }

                it("should not return all cities") {
                    expect(receivedFavouriteCities).to(beNil())
                }

                it("should return error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }


        }

        describe("fetching cities") {

            var receivedCities: [CityWeather]?
            var receivedError: Error?

            beforeEach {
                worker.fetchCitiesWeather { result in
                    switch result {
                    case .success(let cities):
                        receivedCities = cities
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedCities = nil
                receivedError = nil
            }

            it("shoud call networking to fetch city weather") {
                expect(networking.fetchCurrentWeatherForCityCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    networking.fetchCurrentWeatherForCityCompletion?(.success(Mock.CityListApiResponse))
                }

                it("should return cities list") {
                    expect(receivedCities).toNot(beNil())
                    expect(receivedCities?.count).to(equal(Mock.citiesWeather.count))
                }

                it("should return Gdańsk as first city") {
                    expect(receivedCities?.first?.city).to(equal("Gdańsk"))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on error response") {

                beforeEach {
                    networking.fetchCurrentWeatherForCityCompletion?(.failure(UnitTestError()))
                }

                it("should not return cities list") {
                    expect(receivedCities).to(beNil())
                }

                it("should return error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
