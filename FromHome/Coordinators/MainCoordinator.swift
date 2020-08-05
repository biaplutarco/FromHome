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

    var rootController: UIViewController!

    var window: UIWindow

    init(withWindowScene windowScene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)

        window.windowScene = windowScene

        rootController = SetupViewController(self)

        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }

    func start() {}

    func startTransitionTasks(_ backgroundView: UIView) {
        let viewController = TransitionTaskViewController(backgroundView: backgroundView)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        rootController.present(viewController, animated: true, completion: nil)
    }

    func startDailyWork(_ backgroundView: UIView) {
        let viewController = DailyWorkViewController.init(backgroundView: backgroundView)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        rootController.present(viewController, animated: true, completion: nil)
    }
}
