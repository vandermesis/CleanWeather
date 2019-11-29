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
        var worker: CityListWorkerImpl!

        beforeEach {
            networking = FakeWeatherNetworking()
            worker = CityListWorkerImpl(networking: networking)
        }

        describe("fetching cities") {

            var receivedCities: [CityWeather]?
            var receivedError: Error?

            beforeEach {
                worker.fetchCityWeather { result in
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
                expect(networking.fetchCurrentWeatherForAllCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    networking.fetchCurrentWeatherForAllCitiesCompletion?(.success(Mock.citiesWeather))
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
                    networking.fetchCurrentWeatherForAllCitiesCompletion?(.failure(UnitTestError()))
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
