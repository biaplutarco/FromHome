//
//  AtHomeAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class AtHomeAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .warning }

    var title: String = "You are at home now!"

    var leftButtonTitle: String = "OK"

    var bodyMessage: String? = "Go do what you want, EXCEPT the things of your work"

    var rightButtonTitle: String?
}
