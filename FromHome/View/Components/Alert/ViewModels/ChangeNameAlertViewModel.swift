//
//  InputAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 21/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class ChangeNameAlertViewModel: AlertViewModel {

    var type: AlertViewModelType { .input }

    var title: String = "How would you like to be call?"

    var leftButtonTitle: String = "Save"

    var bodyMessage: String?

    var rightButtonTitle: String? { "Cancel" }
}
