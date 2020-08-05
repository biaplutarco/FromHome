//
//  DailyWorkViewController+ClockManager.swift
//  FromHome
//
//  Created by Daniboy on 8/5/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension DailyWorkViewController: ClockManagerDelegate {
    func didFinishCounting(clockManager: ClockManager) {
        print("finished counting to 0, please present a alert")
    }

    func didTick(clockManager: ClockManager) {
        let currentTime = clockManager.currentTime()

        cardContent.updateClock(hours: currentTime.hours, minutes: currentTime.minutes)
    }
}
