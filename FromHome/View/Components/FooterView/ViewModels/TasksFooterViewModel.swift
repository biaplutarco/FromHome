//
//  TasksFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 25/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation
import CoreData

class TasksFooterViewModel: FooterViewModel {

    let coreDataManager = CoreDataManager()

    var type: FooterViewType { .tasks }

    var title: String { "Tasks" }

    var getReady: (sectionTitle: String, tasks: [String]) {

        let predicate = NSPredicate(format: "id CONTAINS[cd] %@", TaskType.getReady.rawValue)

        guard let tasks = coreDataManager.find(objectType: TaskListEntity.self, predicate: predicate).res?.first?.tasks else {

            return ("To get ready", ["", "", ""])
        }

        return ("To get ready", tasks)
    }

    var goHome: (sectionTitle: String, tasks: [String]) {

        let predicate = NSPredicate(format: "id CONTAINS[cd] %@", TaskType.goHome.rawValue)

        guard let tasks = coreDataManager.find(objectType: TaskListEntity.self, predicate: predicate).res?.first?.tasks else {

            return ("To go home", ["", "", ""])
        }

        return ("To go home", tasks)
    }
}
