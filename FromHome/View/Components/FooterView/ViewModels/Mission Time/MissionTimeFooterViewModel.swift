//
//  MissionTimeFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 26/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class MissionTimeFooterViewModel: NSObject {

    var enableData = ["no", "yes"]

    var selectedCoffeeBreakHour = 0
    var selectedHour = 0
    var selectedMealBreakEnable = false

    var options: [Option]

    var type: FooterViewType { .missionTime }

    var title: String { "Mission's Time" }

    override init() {

        let hourOption = Option(title: "Hours", inputSelected: String(UserDefaultsManager.workingHours()), type: .workingHours)
        let coffeeBreakOption = Option(title: "Coffee Break", inputSelected: String(UserDefaultsManager.coffeeBreakHours()), type: .coffeeBreakHours)

        var mealBreak: String

        if UserDefaultsManager.mealBreak() {

            mealBreak = "yes"
        } else {

            mealBreak = "no"
        }

        let mealBreakOption = Option(title: "Meal Break", inputSelected: mealBreak, type: .mealBreak)

        options = [hourOption, coffeeBreakOption, mealBreakOption]
    }

    func save() {

        UserDefaultsManager.save(workingHours: selectedHour)
        UserDefaultsManager.save(coffeeBreakHours: selectedCoffeeBreakHour)
        UserDefaultsManager.change(mealBreak: selectedMealBreakEnable)
    }
}
