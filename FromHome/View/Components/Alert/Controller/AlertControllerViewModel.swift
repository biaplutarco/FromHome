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

    enum InputType {
        case changeName
        case changeTask
    }

    func save(_ name: String) {
        UserDefaultsManager.save(name: name)
    }

    func save(_ task: Task) {

        
    }
}
