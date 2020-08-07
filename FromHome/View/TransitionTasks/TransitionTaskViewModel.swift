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
        case goingHome = "Going Home"
    }

    var title: String
    var taskList: [String]

    init(taskType: TransitionTaskViewModel.TransitionType) {
        title = taskType.rawValue

        let predicate = NSPredicate(format: "id CONTAINS[cd] %@", title)
        let tasksData = CoreDataManager().find(objectType: TaskListEntity.self, predicate: predicate)

        taskList = (tasksData.res?.first?.tasks)!
    }
}
