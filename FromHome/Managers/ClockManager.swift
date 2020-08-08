//
//  ClockManager.swift
//  FromHome
//
//  Created by Daniboy on 8/5/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

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

        totalTime = 60

        workingTime = (9, 9)
        coffeeBreakTime = (3, 3)
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

    func currentTime() -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = totalTime / 3_600
        let minutes = totalTime % 3_600 / 60
        let seconds = totalTime % 60

        return (hours, minutes, seconds)
    }

    @objc
    func tick(_ sender: Timer) {
        print("total: \(totalTime)\t\twork: \(workingTime)\t\tbreak: \(coffeeBreakTime)")

        delegate?.didTick(clockManager: self)
        if totalTime == 0 {
            delegate?.didFinishCounting(clockManager: self)
            stopTimer()
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
