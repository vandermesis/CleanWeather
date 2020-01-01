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

        describe("fetching favourite cities weather") {

            var receivedCitiesWeather: [CityWeather]?
            var receivedError: Error?

            beforeEach {
                worker.fetchCitiesWeather(cities: Mock.favouriteCities) { result in
                    switch result {
                    case .success(let cities):
                        receivedCitiesWeather = cities
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedCitiesWeather = nil
                receivedError = nil
            }

            it("should call networking to fetch city weather") {
                expect(networking.fetchCurrentWeatherForCityCalled).to(beTrue())

            }

            context("on success response") {

                beforeEach {
                    networking.fetchCurrentWeatherForCityCompletion[0](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[1](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[2](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[3](.success(Mock.cityListApiResponse))
                }

                afterEach {
                    networking.fetchCurrentWeatherForCityCompletion = []
                }

                it("should return cities list") {
                    expect(receivedCitiesWeather).toNot(beNil())
                    expect(receivedCitiesWeather?.count).to(equal(Mock.citiesWeather.count))
                }

                it("should return Gdańsk as first city") {
                    expect(receivedCitiesWeather?.first?.city).to(equal("Gdańsk"))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on error response") {

                beforeEach {
                    networking.fetchCurrentWeatherForCityCompletion[0](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[1](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[2](.success(Mock.cityListApiResponse))
                    networking.fetchCurrentWeatherForCityCompletion[3](.failure(UnitTestError()))
                }

                afterEach {
                    networking.fetchCurrentWeatherForCityCompletion = []
                }

                it("should not return cities list") {
                    expect(receivedCitiesWeather).to(beNil())
                }

                it("should return error") {
                    expect(receivedError).toEventually(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
