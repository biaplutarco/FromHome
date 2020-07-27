//
//  Alert.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum Alert {

    case skip(_ type: SkipAlertMessage)
    case input(_ type: InputAlertTitle)
    case leave(_ type: LeaveAlertMessage)
    case finish(_ type: FinishAlertMessage)
    case stopClock
    case pause(_ type: BreakAlertMessage)
    case atHome

    var viewModel: AlertViewModel {

        switch self {

            case .skip(let type):
                return SkipAlertViewModel(type)

            case .input(let type):
                return InputAlertViewModel(type)

            case .leave(let type):
                return LeaveAlertViewModel(type)

            case .finish(let type):
                return FinishAlertViewModel(type)

            case .stopClock:
                return PauseAlertViewModel()

            case .pause(let type):
                return BreakAlertViewModel(type)

            case .atHome:
                return AtHomeAlertViewModel()
        }
    }
}
