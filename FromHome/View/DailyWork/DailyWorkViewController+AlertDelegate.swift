//
//  DailyWorkViewController+AlertDelegate.swift
//  FromHome
//
//  Created by Bia Plutarco on 07/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

extension DailyWorkViewController: AlertControllerDelegate {

    func updateView() {

        if let stars = self.stars {

            coordinator?.startTransitionTasks(stars, .goingHome)
        }
    }
}
