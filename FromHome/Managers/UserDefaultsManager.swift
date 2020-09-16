//
//  UserDefaultsManager.swift
//  FromHome
//
//  Created by Bia Plutarco on 28/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

enum UserDefaultsManager {

    enum Key: String {
        case userName// = "userName"
        case workingHours// = "workingHours"
        case coffeeBreakHours// = "coffeeBreakHours"
        case notificationHour// = "notificationHour"
        case mealBreak// = "mealBreak"
        case notificationEnable// = "notificationEnable"
        case onboarding// = "onboarding"
    }

    private static let userDefault = UserDefaults.standard

    static func save(name: String) {
        userDefault.set(name, forKey: Key.userName.rawValue)
    }

    static func userName() -> String {
        userDefault.value(forKey: Key.userName.rawValue) as? String ?? "You"
    }

    static func save(workingHours: Int) {
        userDefault.set(workingHours, forKey: Key.workingHours.rawValue)
    }

    static func workingHours() -> Int {
        userDefault.value(forKey: Key.workingHours.rawValue) as? Int ?? 8
    }

    static func save(coffeeBreakMinutes: Int) {
        userDefault.set(coffeeBreakMinutes, forKey: Key.coffeeBreakHours.rawValue)
    }

    static func coffeeBreakMinutes() -> Int {
        userDefault.value(forKey: Key.coffeeBreakHours.rawValue) as? Int ?? 15
    }

    static func save(notificationHour: Int) {
        userDefault.set(notificationHour, forKey: Key.notificationEnable.rawValue)
    }

    static func notificationHour() -> Int {
        userDefault.value(forKey: Key.notificationHour.rawValue) as? Int ?? 8
    }

    static func change(onboarding: Bool) {
        userDefault.set(onboarding, forKey: Key.onboarding.rawValue)
    }

    static func onboarding() -> Bool {
        userDefault.value(forKey: Key.onboarding.rawValue) as? Bool ?? true
    }

    static func change(mealBreak: Bool) {
        userDefault.set(mealBreak, forKey: Key.mealBreak.rawValue)
    }

    static func mealBreak() -> Bool {
        userDefault.value(forKey: Key.mealBreak.rawValue) as? Bool ?? false
    }

    static func change(notification: Bool) {
        userDefault.set(notification, forKey: Key.notificationEnable.rawValue)
    }

    static func notificationEnable() -> Bool {
        userDefault.value(forKey: Key.notificationEnable.rawValue) as? Bool ?? false
    }
}
