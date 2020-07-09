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

    var navigationController: UINavigationController!
    var tabBarController: UITabBarController?

    var window: UIWindow

    init(withWindowScene windowScene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)

        window.windowScene = windowScene

        childCoordinators.append(TodayCoordinator(self))
        childCoordinators.append(TimersCoordinator(self))
        childCoordinators.append(TasksCoordinator(self))
        childCoordinators.append(NotificationCoordinator(self))

        tabBarController = UITabBarController()

        tabBarController?.viewControllers = childCoordinators.map({ $0.navigationController })

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    func start() {}
}
