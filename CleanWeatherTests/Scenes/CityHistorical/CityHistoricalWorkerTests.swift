//
//  CityHistoricalWorkerTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityHistoricalWorkerTests: QuickSpec {

    override func spec() {

        var networking: FakeWeatherNetworking!
        var worker: CityHistoricalWorkerImpl!

        beforeEach {
            networking = FakeWeatherNetworking()
            worker = CityHistoricalWorkerImpl(networking: networking)
        }

        describe("fetching city historical weather") {

            var receivedCityHistoricalWeather: CityHistorical?
            var receivedError: Error?

            beforeEach {
                worker.fetchCityHistoricalWeather(id: Mock.cityHistorical1.id, date: Date()) {
                    result in
                    switch result {
                    case .success(let cityHistorical):
                        receivedCityHistoricalWeather = cityHistorical
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedCityHistoricalWeather = nil
                receivedError = nil

            }

            it("should call networking to fetch city historical weather for date") {
                expect(networking.fetchHistoricalWeatherForCityCalled).to(beTrue())
                expect(networking.fetchHistoricalWeatherForCityIdCalled).to(equal(Mock.cityHistorical1.id))
                expect(networking.fetchHistoricalWeatherForCityDateCalled).to(beAKindOf(Date.self))
            }

            context("on success response") {

                beforeEach {
                    networking.fetchHistoricalWeatherForCityCompletion?(.success(Mock.cityHistorical4))
                }

                it("should return city historical weather") {
                    expect(receivedCityHistoricalWeather).notTo(beNil())
                    expect(receivedCityHistoricalWeather?.city).to(equal("Tokio"))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    networking.fetchHistoricalWeatherForCityCompletion?(.failure(UnitTestError()))
                }

                it("should not return city historical weather") {
                    expect(receivedCityHistoricalWeather).to(beNil())
                }

                it("should return valid error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
