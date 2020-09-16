//
//  v.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum BreakAlertMessage: String {

    case meal = "The clock is stopped. You can eat your meal now. We mean MEALS not snacks, snacks only on coffee time. When you return we'll continue to count the hours!"
    case coffee = "Take a break from your work, relaxe your mind. Drink some coffee"
}

class BreakAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .warning }
    var title: String
    var leftButtonTitle: String
    var bodyMessage: String?
    var rightButtonTitle: String?

    init(_ message: BreakAlertMessage) {
        self.bodyMessage = message.rawValue
        switch message {
            case .coffee:
                self.title = "Meal break"
                self.leftButtonTitle = "I'm back!"

            case .meal:
                self.title = "It’s coffe time!"
                self.leftButtonTitle = "OK"
        }
    }
}
