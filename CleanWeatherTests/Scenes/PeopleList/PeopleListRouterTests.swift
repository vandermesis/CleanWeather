//
//  PeopleListRouterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class PeopleListRouterTests: QuickSpec {
    
    override func spec() {
        
        var router: PeopleListRouterImpl!
        var controller: UIViewController!
        var navController: UINavigationController!
        
        beforeEach {
            router = PeopleListRouterImpl()
            controller = PeopleListCreator().getController()
            navController = UINavigationController()
            navController.viewControllers = [controller]
            router.controller = controller
        }
        
        describe("navigate to person details") {
            
            beforeEach {
                router.navigateToPersonDetails(personId: "234")
            }
            
            it("should move to expected controller") {
                expect(navController.topViewController).to(beAKindOf(UIViewController.self))
            }
            
        }
    }
}
