//
//  NotificationFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension UIPickerView {

    convenience init(type: OptionType) {

        self.init(frame: .zero)

        tag = type.rawValue
    }
}

class NotificationFooterViewModel: NSObject, OptionsFooterViewModel {

    private var enableData = ["no", "yes"]

    private var selectedEnable = false
    private var selectedHour = 0
    private var selectedMinute = 0

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
        UserDefaultsManager.toggle(notification: selectedEnable)

        updateOptions()
    }
}

extension NotificationFooterViewModel {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        if pickerView.tag == OptionType.time.rawValue {

            return 2
        } else {

            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView.tag == OptionType.time.rawValue {

            switch component {

                case 0:
                    return 25

                case 1:
                    return 60

                default:
                    return 0
            }
        } else {

            return enableData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView.tag == OptionType.time.rawValue {

            switch component {

                case 0:
                    return "\(row) Hour"

                case 1:
                    return "\(row) Minute"
                default:
                    return ""
            }
        } else {

            return enableData[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if pickerView.tag == OptionType.time.rawValue {

            switch component {

                case 0:
                    selectedHour = row

                case 1:
                    selectedMinute = row

                default:
                    return
            }
        } else {

            if enableData[row] == "yes" {

                selectedEnable = true
            } else {

                selectedEnable = false
            }
        }
    }
}
