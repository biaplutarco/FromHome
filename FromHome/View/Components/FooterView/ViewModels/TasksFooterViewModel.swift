//
//  TasksFooterViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 25/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

class TasksFooterViewModel: FooterViewModel {

    var type: FooterViewType { .tasks }

    var title: String { "Tasks" }

    var getReady: (sectionTitle: String, tasks: [String]) {
        ("To get ready", ["Take a shower", "Get dressssss", "Put a records on"])
    }

    var goHome: (sectionTitle: String, tasks: [String]) {
        ("To go home", ["Eat ice cream", "Go to bed", "Go to sleep"])
    }
}
