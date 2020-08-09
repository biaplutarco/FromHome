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
        if clockManager.isOnCoffeeBreak() {
            let currentTime = clockManager.currentBreakTime()
            cardContent.updateClock(hours: currentTime.hours, minutes: currentTime.minutes, seconds: currentTime.seconds)
        } else {
            let currentTime = clockManager.currentTotalTime()
            cardContent.updateClock(hours: currentTime.hours, minutes: currentTime.minutes, seconds: currentTime.seconds)
        }
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
        if isOnBreak {
            cardView.changeTitle(title: "Coffee Break Time")
        } else {
            cardView.changeTitle(title: "Work Time")
        }
    }
}
