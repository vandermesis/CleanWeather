//
//  FavouriteCitiesWorkerTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesWorkerTests: QuickSpec {

    override func spec() {

        var networking: FakeWeatherNetworking!
        var repository: FakeFavouriteCityRepository!
        var worker: FavouriteCitiesWorkerImpl!

        beforeEach {
            networking = FakeWeatherNetworking()
            repository = FakeFavouriteCityRepository()
            worker = FavouriteCitiesWorkerImpl(networking: networking, database: repository)
        }

        describe("fetching all cities") {

            var receivedAllCities: [City]?
            var receivedError: Error?

            beforeEach {
                worker.fetchAllCities { result in
                    switch result {
                    case .success(let allCities):
                        receivedAllCities = allCities
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedAllCities = nil
                receivedError = nil
            }

            it("should call networking to fetch cities") {
                expect(networking.fetchCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    networking.fetchCitiesCompletion?(.success(Mock.AllCitiesApiResponse))
                }

                it("should return all cities") {
                    expect(receivedAllCities).notTo(beNil())
                    expect(receivedAllCities?.count).to(equal(Mock.AllCitiesApiResponse.records.count))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    networking.fetchCitiesCompletion?(.failure(UnitTestError()))
                }

                it("should not return all cities") {
                    expect(receivedAllCities).to(beNil())
                }

                it("should return error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }
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

        describe("saving favourite") {

            var receivedResponse: Empty?
            var receivedError: Error?

            beforeEach {
                worker.saveFavourite(favouriteCities: Mock.favouriteCities) { result in
                    switch result {
                    case .success(let response):
                        receivedResponse = response
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            it("should call repository to save favourite cities") {
                expect(repository.saveFavouriteCalled).to(beTrue())
                expect(repository.saveFavouriteFavouriteCities?.count).to(equal(Mock.favouriteCities.count))
            }

            afterEach {
                receivedResponse = nil
                receivedError = nil
            }

            context("on success response") {

                beforeEach {
                    repository.saveFavouriteCompletion?(.success(Empty()))
                }

                it("should return no response") {
                    expect(receivedResponse).to(beAKindOf(Empty.self))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    repository.saveFavouriteCompletion?(.failure(UnitTestError()))
                }

                it("should not return response") {
                    expect(receivedResponse).to(beNil())
                }

                it("should return error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
