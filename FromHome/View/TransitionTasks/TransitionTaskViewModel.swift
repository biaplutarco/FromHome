//
//  TransitionTaskViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 05/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

struct TransitionTaskViewModel {

    enum TransitionType {

        case getReady
        case goingHome
    }

    var tasksViewModel: TasksViewModel

    init(_ type: TransitionType) {

        switch type {

            case .getReady:
                self.tasksViewModel = GetReadyTasksViewModel()

            case .goingHome:
                self.tasksViewModel = GoingHomeTasksViewModel()
        }
    }
}
