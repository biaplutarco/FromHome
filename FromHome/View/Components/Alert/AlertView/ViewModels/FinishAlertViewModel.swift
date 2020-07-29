//
//  CongratulationsAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum FinishAlertMessage: String {

    case preparation =  "You are prepare to start the mission now"
    case work =  "You finaly finish your work it’s time to go home."
    case coffeeBreak = "Your coffee break it’s over. You need to get back to work now"
}

class FinishAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .warning }

    var title: String

    var leftButtonTitle: String = "OK"

    var bodyMessage: String?

    var rightButtonTitle: String?

    init(_ message: FinishAlertMessage) {

        self.bodyMessage = message.rawValue

        switch message {

            case .coffeeBreak:
                self.title = "Back to work"

            default:
                self.title = "You made it!"
        }
    }
}
