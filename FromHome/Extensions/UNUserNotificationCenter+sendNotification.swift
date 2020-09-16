//
//  UNUserNotificationCenter+sendNotification.swift
//  FromHome
//
//  Created by Daniboy on 9/1/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UserNotifications

extension UNUserNotificationCenter {

    func sendClockNotification(forState isOnCoffeeBreak: Bool, withDelay delay: Int) {
        let content = UNMutableNotificationContent()
        if isOnCoffeeBreak {
            content.title = "It’s time to come home 🌎"
            content.body = "Hey, it’s time to get ready to come home safe and sound!"
        } else {
            content.title = "It’s mission time 🚀"
            content.body = "Hey, it’s time to get ready to your work!"
        }
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        self.add(request)
    }

    func sendClockFinishNotification(withDelay delay: Int) {
        let content = UNMutableNotificationContent()
        content.title = "FINISH"
        content.body = "FINISH"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        self.add(request)
    }
}
