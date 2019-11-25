//
//  PeopleListWorkerTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class PeopleListWorkerTests: QuickSpec {
    
    override func spec() {
        
        var networking: FakePeopleNetworking!
        var worker: PeopleListWorkerImpl!
        
        beforeEach {
            networking = FakePeopleNetworking()
            worker = PeopleListWorkerImpl(networking: networking)
        }
        
        describe("fetching people") {
            
            var receivedPeople: [Person]?
            var receivedError: Error?
            
            beforeEach {
                worker.fetchPeople { result in
                    switch result {
                    case .success(let people):
                        receivedPeople = people
                    case .failure(let error):
                        receivedError = error
                    }
                }
            }
            
            afterEach {
                receivedPeople = nil
                receivedError = nil
            }
            
            context("on success response") {
                
                beforeEach {
                    networking.fetchPeopleCompletion?(.success(Mock.people))
                }
                
                it("should return people list") {
                    expect(receivedPeople).toNot(beNil())
                    expect(receivedPeople?.count).to(equal(4))
                }
                
                it("should return no errors") {
                    expect(receivedError).to(beNil())
                }
                
            }
            
            context("on error response") {
                
                beforeEach {
                    networking.fetchPeopleCompletion?(.failure(AppError(message: "error")))
                }
                
                it("should not return people list") {
                    expect(receivedPeople).to(beNil())
                }
                
                it("should return error") {
                    expect(receivedError).to(beAKindOf(AppError.self))
                }
                
            }
        }
    }
}
