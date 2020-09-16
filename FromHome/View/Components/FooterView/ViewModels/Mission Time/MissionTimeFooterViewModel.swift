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

    var selectedCoffeeBreakMinutes = 0
    var selectedHour = 0
    var selectedMealBreakEnable = false

    var options: [Option]

    var type: FooterViewType { .missionTime }

    var title: String { "Mission's Time" }

    override init() {

        let hourOption = Option(
            title: "Work Hours",
            inputSelected: String(UserDefaultsManager.workingHours()),
            type: .workingHours
        )

        let coffeeBreakOption = Option(
            title: "Coffee Break",
            inputSelected: String(UserDefaultsManager.coffeeBreakMinutes()),
            type: .coffeeBreakHours
        )

        options = [hourOption, coffeeBreakOption]
    }

    func save() {
        UserDefaultsManager.save(workingHours: selectedHour)
        UserDefaultsManager.save(coffeeBreakMinutes: selectedCoffeeBreakMinutes)
        UserDefaultsManager.change(mealBreak: selectedMealBreakEnable)
    }
}
