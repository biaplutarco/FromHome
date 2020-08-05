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

    init(hours: Int, minutes: Int, delegate: ClockManagerDelegate) {
        counter = hours * 3_600 + minutes * 60
        self.delegate = delegate
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: self.tick)
        timer?.fire()
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func currentTime() -> (hours: Int, minutes: Int) {
        let hours = counter / 3_600
        let minutes = counter % 3_600 / 60

        return (hours, minutes)
    }

    @objc
    func tick(_ sender: Timer) {
        if counter == 0 {
            delegate?.didFinishCounting(clockManager: self)
            stopTimer()
        }
        counter = counter - 1
        delegate?.didTick(clockManager: self)
    }
}
