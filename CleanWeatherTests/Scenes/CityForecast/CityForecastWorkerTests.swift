//
//  CityForecastWorkerTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastWorkerTests: QuickSpec {

    override func spec() {

        var networking: FakeWeatherNetworking!
        var worker: CityForecastWorkerImpl!

        beforeEach {
            networking = FakeWeatherNetworking()
            worker = CityForecastWorkerImpl(networking: networking)
        }

        describe("fetching city hour details list") {

            var receivedCityHourlyForecastList: CityForecast?
            var receivedError: Error?

            beforeEach {
                worker.fetchCityForecast(coordinates: Mock.cityWeather2.id) { result in
                    switch result {
                    case .success(let cityHourForecast):
                        receivedCityHourlyForecastList = cityHourForecast
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }

            afterEach {
                receivedCityHourlyForecastList = nil
                receivedError = nil
            }

            it("should call networking to fetch city hour details list for valid id") {
                expect(networking.fetchForecastWeatherForCityCalled).to(beTrue())
                expect(networking.fetchForecastWeatherForCityCoordinatesCalled).to(equal(Mock.cityWeather2.id))
            }

            context("on success response") {

                beforeEach {
                    networking.fetchForecastWeatherForCityCompletion?(.success(Mock.cityForecastApiResponse))
                }

                it("should return city hourly forecast list") {
                    expect(receivedCityHourlyForecastList).notTo(beNil())
                    expect(receivedCityHourlyForecastList?.0.count).to(equal(Mock.cityForecastApiResponse.hourly.data.count))
                }

                it("should return city daily forecast list") {
                    expect(receivedCityHourlyForecastList).notTo(beNil())
                    expect(receivedCityHourlyForecastList?.1.count).to(equal(Mock.cityForecastApiResponse.daily.data.count))
                }

                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    networking.fetchForecastWeatherForCityCompletion?(.failure(UnitTestError()))
                }

                it("should not return city hour details list") {
                    expect(receivedCityHourlyForecastList).to(beNil())
                }

                it("should return valid error") {
                    expect(receivedError).to(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
