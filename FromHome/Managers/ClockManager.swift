//
//  ClockManager.swift
//  FromHome
//
//  Created by Daniboy on 8/5/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation
import UserNotifications

protocol ClockManagerDelegate: AnyObject {
    func didTick(clockManager: ClockManager)
    func didFinishCounting(clockManager: ClockManager)
    func didChangeState(clockManager: ClockManager, isOnBreak: Bool)
}

class ClockManager {

    private var totalTime: Int
    private var workingTime: (current: Int, total: Int)
    private var coffeeBreakTime: (current: Int, total: Int)

    private var timer: Timer?

    weak var delegate: ClockManagerDelegate?

    private var isTimerPaused = false
    private var isOnBreak = false

    init(workHours: Int, coffeeBreakMinutes: Int) {
        totalTime = workHours * 3_600

        workingTime = (30 * 60, 30 * 60)
        coffeeBreakTime = (coffeeBreakMinutes * 60, coffeeBreakMinutes * 60)

        totalTime = 30

        workingTime = (10, 10)
        coffeeBreakTime = (2, 2)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: self.tick)
        timer?.fire()

        isTimerPaused = false
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil

        isTimerPaused = true
    }

    func isPaused() -> Bool { isTimerPaused }

    func isOnCoffeeBreak() -> Bool { isOnBreak }

    func currentTotalTime() -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = totalTime / 3_600
        let minutes = totalTime % 3_600 / 60
        let seconds = totalTime % 60

        return (hours, minutes, seconds)
    }

    func currentWorkTime() -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = totalTime / 3_600
        let minutes = totalTime % 3_600 / 60
        let seconds = totalTime % 60

        return (hours, minutes, seconds)
    }

    func currentBreakTime() -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = coffeeBreakTime.current / 3_600
        let minutes = coffeeBreakTime.current % 3_600 / 60
        let seconds = coffeeBreakTime.current % 60

        return (hours, minutes, seconds)
    }

    func remainingCurrentTime() -> Int {
        if isOnBreak {
            return  coffeeBreakTime.current
        } else {
            return workingTime.current
        }
    }

    func updateCurrentTime(timeInterval: TimeInterval) {
        totalTime = totalTime - Int(timeInterval)

        var timeToCount = Int(timeInterval)

        if totalTime <= 0 {
            totalTime = 0
            stopTimer()
            delegate?.didFinishCounting(clockManager: self)
        } else {
            while (timeToCount != 0) {
                if timeToCount >= remainingCurrentTime() {
                    if isOnBreak {
                        timeToCount = timeToCount - coffeeBreakTime.current
                        totalTime = totalTime - coffeeBreakTime.current
                        isOnBreak = false
                        coffeeBreakTime.current = coffeeBreakTime.total
                    } else {
                        timeToCount = timeToCount - workingTime.current
                        totalTime = totalTime - workingTime.current
                        isOnBreak = true
                        coffeeBreakTime.current = workingTime.total
                    }
                } else {
                    if isOnBreak {
                        coffeeBreakTime.current = coffeeBreakTime.current - timeToCount
                        timeToCount = 0
                    } else {
                        workingTime.current = workingTime.current - timeToCount
                        timeToCount = 0
                    }
                }
            }
        }
    }

    func makeNotification() -> Date {
        if isPaused() == false {
            stopTimer()

            var timeToCount = 0
            var stateToCount = isOnBreak

            UNUserNotificationCenter.current().sendClockFinishNotification(withDelay: totalTime)

            if isOnBreak {
                timeToCount = timeToCount + coffeeBreakTime.current
                stateToCount = false

                UNUserNotificationCenter.current().sendClockNotification(
                    forState: false,
                    withDelay: coffeeBreakTime.current
                )
            } else {
                timeToCount = timeToCount + workingTime.current
                stateToCount = true

                UNUserNotificationCenter.current().sendClockNotification(
                    forState: true,
                    withDelay: workingTime.current
                )
            }

            while timeToCount <= totalTime {
                if stateToCount {
                    timeToCount = timeToCount + coffeeBreakTime.total
                    stateToCount = false
                    UNUserNotificationCenter.current().sendClockNotification(
                        forState: stateToCount,
                        withDelay: timeToCount
                    )
                } else {
                    timeToCount = timeToCount + workingTime.total
                    stateToCount = true
                    UNUserNotificationCenter.current().sendClockNotification(
                        forState: stateToCount,
                        withDelay: timeToCount
                    )
                }
            }
            return Date.init(timeIntervalSinceNow: 0)
        } else {
            return Date.init(timeIntervalSince1970: 0)
        }
    }

    @objc
    func tick(_ sender: Timer) {
        print("total: \(totalTime)\t\twork: \(workingTime)\t\tbreak: \(coffeeBreakTime)")

        delegate?.didTick(clockManager: self)
        if totalTime <= 0 {
            totalTime = 0
            stopTimer()
            delegate?.didFinishCounting(clockManager: self)
        } else {
            totalTime = totalTime - 1

            if isOnBreak {
                if coffeeBreakTime.current == 0 {
                    isOnBreak = false
                    delegate?.didChangeState(clockManager: self, isOnBreak: isOnBreak)
                    coffeeBreakTime.current = coffeeBreakTime.total
                } else {
                    coffeeBreakTime.current = coffeeBreakTime.current - 1
                }
            } else {
                if workingTime.current == 0 {
                    isOnBreak = true
                    delegate?.didChangeState(clockManager: self, isOnBreak: isOnBreak)
                    workingTime.current = workingTime.total
                } else {
                    workingTime.current = workingTime.current - 1
                }
            }
        }
    }
}
