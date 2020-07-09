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

    var navigationController: UINavigationController!

    weak var parentCoordinator: Coordinator?

    init(_ parentCoordinator: MainCoordinator) {
        self.parentCoordinator = parentCoordinator

        let viewController = NotificationViewController()

        navigationController = UINavigationController.init(rootViewController: viewController)

        viewController.navigationItem.hidesBackButton = true
        viewController.coordinator = self
    }

    func start() {}
}
