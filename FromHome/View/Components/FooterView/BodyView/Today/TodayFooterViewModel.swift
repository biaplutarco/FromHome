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

            return "PArabens fez suas horinhas yay!!"
        } else {

            return "Vai trabalhar vagabundo antes que eu faça o relatorio!!"
        }
    }

    var isWorkinHoursCompleted: Bool { false }
}
