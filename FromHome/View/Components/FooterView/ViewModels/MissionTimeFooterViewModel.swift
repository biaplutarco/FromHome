//
//  MissionTimeFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class MissionTimeFooterViewModel: NSObject, OptionsFooterViewModel {

    private var enableData = ["no", "yes"]

    private var selectedCoffeeBreakHour = 0
    private var selectedHour = 0
    private var selectedMealBreakEnable = false

    var options: [Option]

    var type: FooterViewType { .missionTime }

    var title: String { "Mission's Time" }

    override init() {

        let hourOption = Option(title: "Hours", inputSelected: String(UserDefaultsManager.workingHours()), type: .workingHours)
        let coffeeBreakOption = Option(title: "Coffee Break", inputSelected: String(UserDefaultsManager.coffeeBreakHours()), type: .coffeeBreakHours)
        let mealBreakOption = Option(title: "Meal Break", inputSelected: String(UserDefaultsManager.mealBreak()), type: .mealBreak)

        options = [hourOption, coffeeBreakOption, mealBreakOption]
    }

    func save() {

        UserDefaultsManager.save(workingHours: selectedHour)
        UserDefaultsManager.save(coffeeBreakHours: selectedCoffeeBreakHour)
        UserDefaultsManager.toggle(mealBreak: selectedMealBreakEnable)
    }
}

extension MissionTimeFooterViewModel {

    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView.tag == OptionType.workingHours.rawValue {

            return 12
        } else if pickerView.tag == OptionType.coffeeBreakHours.rawValue {

            return 60
        } else {

            return enableData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView.tag == OptionType.workingHours.rawValue {

            return "\(row) Hours"
        } else if pickerView.tag == OptionType.coffeeBreakHours.rawValue {

            return "\(row) Minutes"
        } else {

            return enableData[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if pickerView.tag == OptionType.workingHours.rawValue {

            selectedHour = row
        } else if pickerView.tag == OptionType.coffeeBreakHours.rawValue {

            selectedCoffeeBreakHour = row
        } else {

            if enableData[row] == "yes" {

                selectedMealBreakEnable = true
            } else {

                selectedMealBreakEnable = false
            }
        }
    }
}
