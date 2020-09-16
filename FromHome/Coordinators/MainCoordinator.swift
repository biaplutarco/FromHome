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

    func startTransitionTasks(_ stars: [CAShapeLayer], _ taskType: TransitionTaskViewModel.TransitionType) {
        let viewController = TransitionTaskViewController(
            stars: stars,
            taskType: taskType,
            coordinator: self
        )

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        rootController.pushViewController(viewController, animated: false)
    }

    func startDailyWork(_ stars: [CAShapeLayer]) {
        let viewController = DailyWorkViewController.init(stars: stars, coordinator: self)

        rootController.pushViewController(viewController, animated: false)
    }

    func showOnboarding() {
        let onboarding = OnboardingViewController.init(nibName: nil, bundle: nil)
        //onboarding.modalPresentationStyle = .fullScreen
        rootController.present(onboarding, animated: true, completion: nil)
    }

    func returnToSetup() {
        rootController.popToRootViewController(animated: false)
    }
}
