//
//  MainCoordinator.swift
//  FromHome
//
//  Created by Daniboy on 7/6/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var viewController: UIViewController!

    var window: UIWindow

    init(withWindowScene windowScene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)

        window.windowScene = windowScene

        viewController = SetupViewController(self)

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func start() {}

    func startDailyWork() {
        viewController.present(UIViewController(), animated: true, completion: nil)
    }
}
