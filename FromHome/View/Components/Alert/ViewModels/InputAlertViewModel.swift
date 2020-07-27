//
//  InputAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum InputAlertTitle: String {

    case changeName = "How would you like to be call?"
    case changeTask = "Write your new task"
}

class InputAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .input }

    var title: String

    var leftButtonTitle: String = "Save"

    var bodyMessage: String?

    var rightButtonTitle: String? { "Cancel" }

    init(_ title: InputAlertTitle) {
        self.title = title.rawValue
    }
}
