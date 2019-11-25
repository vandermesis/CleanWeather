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

        var person: [Person]!
        var displayable: [PersonDisplayable]!

        describe("PersonDisplayable convert") {

            beforeEach {
                person = Mock.people
                displayable = person.map { PersonDisplayable.convert(from: $0 )}
            }

            it("should return a valid names") {
                expect(displayable[0].name).to(equal("Bernadette Bransden"))
            }

            it("should return a valid genderIconName") {
                expect(displayable[1].genderIconName).to(equal("femaleIcon"))
                expect(displayable[2].genderIconName).to(equal("maleIcon"))
            }

            it("should return all properties of type String") {
                expect(displayable[2].id).to(beAKindOf(String.self))
                expect(displayable[2].name).to(beAKindOf(String.self))
                expect(displayable[2].age).to(beAKindOf(String.self))
                expect(displayable[2].genderIconName).to(beAKindOf(String.self))
            }
        }
    }
}
