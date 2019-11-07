//
//  SceneDelegate.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let startingController = setupStartingController()
        displayStartingController(controller: startingController, at: windowScene)
    }

}

private extension SceneDelegate {
    
    private func setupStartingController() -> UIViewController {
        return PeopleListCreator().getController()
    }
    
    private func displayStartingController(controller: UIViewController, at scene: UIWindowScene) {
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }

}
