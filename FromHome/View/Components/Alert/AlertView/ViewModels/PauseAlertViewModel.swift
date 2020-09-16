//
//  PauseAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class PauseAlertViewModel: AlertViewModel {
    var type: AlertViewModelType { .warning }
    var title: String = "In pause"
    var leftButtonTitle: String = "I'm back!"
    var bodyMessage: String? = "It’s no cool do that, but we will got your back. The clock is stopped now. Hurry up!"
    var rightButtonTitle: String?
}
