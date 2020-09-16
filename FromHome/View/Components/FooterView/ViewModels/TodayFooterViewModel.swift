//
//  TodayFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class TodayFooterViewModel: FooterViewModel {

    var type: FooterViewType { .today }

    var title: String { "Today" }
    var buttonTitle: String { "Start" }

    var bodyText: String {
        if isWorkinHoursCompleted {
            return "You already completed your working hours for today. Comeback tomorrow!"
        } else {
            return "Would you like to start your today’s mission now?"
        }
    }

    var isWorkinHoursCompleted: Bool { false }
}
