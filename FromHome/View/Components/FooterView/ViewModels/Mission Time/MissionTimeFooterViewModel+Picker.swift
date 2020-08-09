//
//  File.swift
//  FromHome
//
//  Created by Bia Plutarco on 02/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension MissionTimeFooterViewModel: OptionsFooterViewModel {

    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView.tag == OptionType.workingHours.rawValue {

            return 12
        } else if pickerView.tag == OptionType.coffeeBreakHours.rawValue {

            return 16
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

            selectedCoffeeBreakMinutes = row
        } else {

            if enableData[row] == "yes" {

                selectedMealBreakEnable = true
            } else {

                selectedMealBreakEnable = false
            }
        }
    }
}
