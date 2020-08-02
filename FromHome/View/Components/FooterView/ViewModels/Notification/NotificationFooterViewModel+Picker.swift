//
//  File.swift
//  FromHome
//
//  Created by Bia Plutarco on 02/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension NotificationFooterViewModel: OptionsFooterViewModel {

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
