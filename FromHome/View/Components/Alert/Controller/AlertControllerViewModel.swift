//
//  AlertControllerViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 28/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation
import CoreData

struct AlertControllerViewModel {

    let coreDataManager = CoreDataManager()

    func save(_ name: String) {
        UserDefaultsManager.save(name: name)
    }

    func save(_ task: Task) {

        let predicate = NSPredicate(format: "id CONTAINS[cd] %@", task.type.rawValue)

        if let taskList = coreDataManager.find(objectType: TaskListEntity.self, predicate: predicate).res?.first {

            taskList.tasks?.remove(at: task.index)
            taskList.tasks?.insert(task.name, at: task.index)

            coreDataManager.writeChanges()
        }
    }
}
