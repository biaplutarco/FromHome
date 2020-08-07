//
//  TransitionTaskViewController+Alert.swift
//  FromHome
//
//  Created by Bia Plutarco on 07/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension TransitionTaskViewController: AlertControllerDelegate {

    func updateView() {

        if let stars = self.stars {

            coordinator?.startDailyWork(stars)
        }
    }
}
