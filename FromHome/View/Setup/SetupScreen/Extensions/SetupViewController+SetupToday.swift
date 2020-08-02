//
//  SetupViewController+SetupToday.swift
//  FromHome
//
//  Created by Daniboy on 8/2/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension SetupViewController: SetupTodayViewDelegate {
    func startTodayButtonPressed(_ view: SetupTodayView) {
        coordinator?.startDailyWork()
    }
}
