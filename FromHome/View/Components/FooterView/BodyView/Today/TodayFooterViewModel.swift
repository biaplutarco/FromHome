//
//  TodayFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 11/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

//  Alguma coisa tem que triggar isso aqui e mudar o estado quando a pessoa completar as horas
//  Observer?
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
