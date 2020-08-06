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
}

class ClockManager {

    private var counter: Int

    private var timer: Timer?

    weak var delegate: ClockManagerDelegate?

    private var isTimerPaused = false

    init(hours: Int, minutes: Int, delegate: ClockManagerDelegate) {
        counter = hours * 3_600 + minutes * 60
        self.delegate = delegate
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
        let hours = counter / 3_600
        let minutes = counter % 3_600 / 60
        let seconds = counter % 60

        return (hours, minutes, seconds)
    }

    @objc
    func tick(_ sender: Timer) {
        print(counter)
        counter = counter - 1
        if counter == 0 {
            delegate?.didFinishCounting(clockManager: self)
            stopTimer()
        }
        delegate?.didTick(clockManager: self)
    }
}
