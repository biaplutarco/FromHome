//
//  OptionsFooterViewModel.swift
//  
//
//  Created by Bia Plutarco on 26/07/20.
//

import UIKit

enum OptionType: Int {
    case enable = 1
    case time = 2
    case mealBreak = 3
    case workingHours = 4
    case coffeeBreakHours = 5
}

struct Option {

    var title: String
    var inputSelected: String
    var type: OptionType
}

protocol OptionsFooterViewModel: FooterViewModel, UIPickerViewDelegate, UIPickerViewDataSource {

    var options: [Option] { get set }

    func save()
}

extension OptionsFooterViewModel {

    func newInput(for tag: Int) -> String? {

        switch tag {

            case 1:

                if UserDefaultsManager.notificationEnable() {

                    return "yes"
                } else {

                    return "no"
                }

            case 2:
                return String(UserDefaultsManager.notificationHour())

            case 3:
                if UserDefaultsManager.mealBreak() {

                    return "yes"
                } else {

                    return "no"
                }

            case 4:
                return String(UserDefaultsManager.workingHours())

            case 5:
                return String(UserDefaultsManager.coffeeBreakHours())

            default:
                return nil
        }
    }
}
