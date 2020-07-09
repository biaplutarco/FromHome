//
//  NotificationCoordinator.swift
//  FromHome
//
//  Created by Daniboy on 7/9/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class NotificationCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()

    var viewController: UIViewController!

    weak var parentCoordinator: Coordinator?

    init(_ parentCoordinator: MainCoordinator) {
        self.parentCoordinator = parentCoordinator

        let notificationViewController = NotificationViewController()
        notificationViewController.coordinator = self
        viewController = notificationViewController
    }

    func start() {}
}
