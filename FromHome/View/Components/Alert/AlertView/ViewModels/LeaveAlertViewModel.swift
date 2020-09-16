//
//  LeftAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum LeaveAlertMessage: String {

    case coffeeBreak =  "Are you sure you want to leave? This is the time to you relaxe to not get so much tired working"
    case work =  "Are you sure you want to leave? You will lose your progress"
}

class LeaveAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .getOut }
    var title: String = "Leave"
    var leftButtonTitle: String = "Yes"
    var bodyMessage: String?
    var rightButtonTitle: String? { "Cancel" }

    init(_ message: LeaveAlertMessage) {
        self.bodyMessage = message.rawValue
    }
}
