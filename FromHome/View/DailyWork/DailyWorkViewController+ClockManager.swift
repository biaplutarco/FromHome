//
//  DailyWorkViewController+ClockManager.swift
//  FromHome
//
//  Created by Daniboy on 8/5/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension DailyWorkViewController: ClockManagerDelegate {

    func didTick(clockManager: ClockManager) {
        let currentTime = clockManager.currentTime()

        cardContent.updateClock(hours: currentTime.hours, minutes: currentTime.minutes, seconds: currentTime.seconds)
    }

    func didFinishCounting(clockManager: ClockManager) {
        if let universeView = view as? UniverseView {

            stars = universeView.stars

            let alert = AlertViewController(.finish(.work))
            alert.delegate = self

            present(alert, animated: true, completion: nil)
        }
    }

    func didChangeState(clockManager: ClockManager, isOnBreak: Bool) {
        print("CHANGE!! isOnBreak: \(isOnBreak)")
    }
}
