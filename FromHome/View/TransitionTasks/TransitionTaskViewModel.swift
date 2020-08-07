//
//  TransitionTaskViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 05/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

struct TransitionTaskViewModel {

    enum TransitionType: String {

        case getReady = "Get Ready"
        case goingHome
    }

    var title: String
    var taskList: [String]

    init(taskType: TransitionTaskViewModel.TransitionType) {
        title = taskType.rawValue
        taskList = ["1","2","3"]
    }
}
