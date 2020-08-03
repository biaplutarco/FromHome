//
//  NotificationFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class NotificationFooterViewModel: NSObject {

    var enableData = ["no", "yes"]

    var selectedEnable = false
    var selectedHour = 0
    var selectedMinute = 0

    var options: [Option]

    var type: FooterViewType { .notification }

    var title: String { "Notification" }

    override init() {

        var enable: String

        if UserDefaultsManager.notificationEnable() {

            enable = "yes"
        } else {

            enable = "no"
        }

        let enableOption = Option(title: "Enable", inputSelected: enable, type: .enable)
        let timeOption = Option(title: "Time to work", inputSelected: String(UserDefaultsManager.notificationHour()), type: .time)

        options = [enableOption, timeOption]
    }

    private func updateOptions() {

        options.removeAll()

        let enableOption = Option(title: "Enable", inputSelected: String(UserDefaultsManager.notificationEnable()), type: .enable)
        print(String(UserDefaultsManager.notificationEnable()))
        let timeOption = Option(title: "Time to work", inputSelected: String(UserDefaultsManager.notificationHour()), type: .time)

        options = [enableOption, timeOption]
    }

    func save() {

        UserDefaultsManager.save(notificationHour: selectedHour)
        UserDefaultsManager.change(notification: selectedEnable)

        updateOptions()
    }
}
