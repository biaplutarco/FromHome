//
//  TimersCoordinator.swift
//  FromHome
//
//  Created by Daniboy on 7/9/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class TimersCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()

    var viewController: UIViewController!

    weak var parentCoordinator: Coordinator?

    init(_ parentCoordinator: MainCoordinator) {
        self.parentCoordinator = parentCoordinator

        let timersViewControllers = TimersViewController()
        timersViewControllers.coordinator = self
        viewController = timersViewControllers
    }

    func start() {}
}
