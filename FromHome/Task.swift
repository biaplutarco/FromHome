//
//  Task.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

struct Task {

    enum TaskType: String {

        case getReady = "getReady"
        case goHome = "goHome"
    }

    var name: String
    var type: TaskType
    var index: Int
}
