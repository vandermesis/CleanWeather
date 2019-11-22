//
//  PeopleListPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class PeopleListPresenterTests: QuickSpec {
    
    override func spec() {
        
        var presenter: PeopleListPresenterImpl<FakePeopleListController>!
        var controller: FakePeopleListController!
        
        beforeEach {
            controller = FakePeopleListController()
            presenter = PeopleListPresenterImpl()
            presenter.controller = controller
        }
        
        describe("displaying people") {
            
            beforeEach {
                presenter.displayPeople(people: Mock.people)
            }
            
            it("should call controller to display people") {
                expect(controller.displayPeopleCalled).toNot(beNil())
                expect(controller.displayPeopleCalled?.count).to(equal(Mock.people.count))
            }
            
        }
        
        
        describe("displaying people") {
            
            beforeEach {
                presenter.changeBackgroundColor(.blue)
            }
            
            it("should call controller to change color") {
                expect(controller.changeBackgroundColorCalled).to(equal(.blue))
            }
            
        }
    }
}
