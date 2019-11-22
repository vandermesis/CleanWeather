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
            
            it("should have valid names") {
                //TODO: Remove this comment after understanding:
                // our presenter converts Person to PersonDisplayable, which is joining first and last name, that's why I check it here
                // but if you want you can add more checks
                // and maybe better if you create your own unit test for 'PersonDisplayable' where you give a normal 'Person' and you validates if all fields are set properly :)
                expect(controller.displayPeopleCalled?[4].name).to(equal("Dael Vignaux"))
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
