//
//  GetReadyTasksViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 03/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class GetReadyTasksViewModel: TasksViewModel {

    var title: String { "Get Ready" }

    var taskList: [String] {
        ["Take a shower", "Get dress", "Take another shower"]
    }
}
