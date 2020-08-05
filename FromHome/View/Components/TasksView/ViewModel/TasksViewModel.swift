//
//  TasksViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 03/08/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

protocol TasksViewModel {
    var title: String { get }
    var taskList: [String] { get }
}
