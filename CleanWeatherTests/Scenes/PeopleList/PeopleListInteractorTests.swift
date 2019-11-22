//
//  PeopleListInteractorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class PeopleListInteractorTests: QuickSpec {
    
    override func spec() {
        
        var router: FakePeopleListRouter!
        var worker: FakePeopleListWorker!
        var presenter: FakePeopleListPresenter!
        var interactor: PeopleListInteractorImpl!
        
        beforeEach {
            router = FakePeopleListRouter()
            worker = FakePeopleListWorker()
            presenter = FakePeopleListPresenter()
            interactor = PeopleListInteractorImpl(presenter: presenter, worker: worker, router: router)
        }
        
        describe("getting people") {
            
            beforeEach {
                interactor.getPeople()
            }
            
            it("should call presenter show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }
            
            it("should call worker to fetch people") {
                expect(worker.fetchPeopleCalled).to(beTrue())
            }
            
            context("on success response") {
                
                beforeEach {
                    worker.fetchPeopleCompletion?(.success(Mock.people))
                }
                
                it("should call presenter hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }
                
                it("should not call presenter to display any alert") {
                    expect(presenter.presentErrorCalled).to(beNil())
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                }
                
                it("should call presenter to display valid people") {
                    expect(presenter.displayPeopleCalled).toNot(beNil())
                    expect(presenter.displayPeopleCalled?.count).to(equal(Mock.people.count))
                }
            }
            
            context("on error response") {
                
                beforeEach {
                    worker.fetchPeopleCompletion?(.failure(AppError(message: "error")))
                }
                
                it("should call presenter hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }
                
                it("should call presenter to display an error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(AppError.self))
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                }
                
                it("should not call presenter to display people") {
                    expect(presenter.displayPeopleCalled).to(beNil())
                }
            }
        }
        
        describe("selecting person cell") {
            
            beforeEach {
                interactor.getPeople()
                worker.fetchPeopleCompletion?(.success(Mock.people))
                interactor.didSelectPersonCell(personId: Mock.people[3].id)
            }
            
            it("should call router to navigate to person") {
                expect(router.navigateToPersonDetailsPersonIdCalled).to(equal(Mock.people[3].id))
            }
            
        }
        
        describe("changing background") {
            
            context("people list is empty") {

                beforeEach {
                    interactor.changeBackground()
                }
                
                it("should call presenter to change color") {
                    expect(presenter.changeBackgroundColorCalled).to(equal(.red))
                }
                
            }
            
            context("people list is filled") {
                
                beforeEach {
                    interactor.getPeople()
                    worker.fetchPeopleCompletion?(.success(Mock.people))
                    interactor.changeBackground()
                }
                
                it("should call presenter to change color") {
                    expect(presenter.changeBackgroundColorCalled).to(equal(.blue))
                }
            }
        }
    }
}
