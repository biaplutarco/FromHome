//
//  UserDefaultsManager.swift
//  FromHome
//
//  Created by Bia Plutarco on 28/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class UserDefaultsManager {

    enum Key: String {

        case notification = "notification"
        case userName = "userName"
        case workingHours = "workingHours"
        case coffeeBreakHours = "coffeeBreakHours"
        case mealBreak = "mealBreak"
    }

    struct Notification {

        let enable: Bool
        let time: String?

        init(_ json: [String: Any]) {
            self.enable = json[notificationEnable] as? Bool ?? false
            self.time = json[notificationTime] as? String ?? ""
        }
    }

    static let (notificationEnable, notificationTime) = ("notificationEnable", "notificationTime")
    private static let userDefault = UserDefaults.standard

    static func save(name: String) {
        userDefault.set(name, forKey: Key.userName.rawValue)
    }

    static func save(workingHours: Int) {
        userDefault.set(workingHours, forKey: Key.workingHours.rawValue)
    }

    static func save(coffeeBreakHours: Int) {
        userDefault.set(coffeeBreakHours, forKey: Key.coffeeBreakHours.rawValue)
    }

    static func toggle(mealBreak: Bool) {
        userDefault.set(mealBreak, forKey: Key.mealBreak.rawValue)
    }

    static func toggle(notification: Notification) {
        userDefault.set([notificationEnable: notification.enable, notificationTime: notification.time ?? ""], forKey: Key.notification.rawValue)
    }

    static func userName() -> String {
        userDefault.value(forKey: Key.userName.rawValue) as? String ?? "Sem nome"
    }

    static func workingHours() -> Int {
        userDefault.value(forKey: Key.workingHours.rawValue) as? Int ?? 8
    }

    static func coffeeBreakHours() -> Int {
        userDefault.value(forKey: Key.coffeeBreakHours.rawValue) as? Int ?? 15
    }

    static func mealBreak() -> Bool {
        userDefault.value(forKey: Key.mealBreak.rawValue) as? Bool ?? false
    }

    static func notification() -> Notification {
        Notification((userDefault.value(forKey: Key.notification.rawValue) as? [String: Any]) ?? [:])
    }
}
