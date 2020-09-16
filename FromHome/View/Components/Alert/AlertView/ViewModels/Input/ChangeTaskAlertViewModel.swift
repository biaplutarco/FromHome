//
//  ChangeTaskAlertViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class ChangeTaskAlertViewModel: InputAlertViewModel {

    var oldTask: Task

    init(oldTask: Task) {
        self.oldTask = oldTask
        super.init(.changeTask)
    }
}
