//
//  PersonDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 24/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class PersonDisplayableTests: QuickSpec {

    override func spec() {

        var displayable: PersonDisplayable!

        describe("Person should be converted to PersonDisplayable") {

            beforeEach {
                displayable = PersonDisplayable.convert(from: Mock.person1)
            }

            it("should return a valid id") {
                expect(displayable.id).to(equal("fb812bd3-8bbd-47cc-92f5-fb6205bf0ccd"))
            }

            it("should return a valid name") {
                expect(displayable.name).to(equal("Bernadette Bransden"))
            }

            it("should return a valid age") {
                expect(displayable.age).to(equal("23"))
            }
        }
    }
}
