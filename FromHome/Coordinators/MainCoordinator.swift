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

    var rootController: UINavigationController!

    var window: UIWindow

    init(withWindowScene windowScene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)

        window.windowScene = windowScene

        rootController = UINavigationController.init(rootViewController: SetupViewController(self))
        rootController.navigationBar.isHidden = true

        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }

    func start() {}

    func startTransitionTasks(_ backgroundView: UIView, taskType: TransitionTaskViewModel.TransitionType) {
        let viewController = TransitionTaskViewController(
            backgroundView: backgroundView,
            taskType: taskType,
            coordinator: self
        )

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        rootController.pushViewController(viewController, animated: false)
    }

    func startDailyWork(_ backgroundView: UIView) {
        let viewController = DailyWorkViewController.init(backgroundView: backgroundView, coordinator: self)

        rootController.pushViewController(viewController, animated: false)
    }

    func returnToSetup() {
        rootController.popToRootViewController(animated: false)
    }
}
