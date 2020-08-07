//
//  Task.swift
//  FromHome
//
//  Created by Bia Plutarco on 06/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

enum TaskType: String {

    case getReady
    case goHome
}

struct Task {

    var name: String
    var type: TaskType
    var index: Int
}
