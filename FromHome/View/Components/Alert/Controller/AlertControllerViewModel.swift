//
//  AlertControllerViewModel.swift
//  FromHome
//
//  Created by Bia Plutarco on 28/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import Foundation

struct AlertControllerViewModel {

    enum InputType {
        case changeName
        case changeTask
    }

    func save(_ input: String, _ type: InputType) {

        switch type {

            case .changeName:
                UserDefaultsManager.save(name: input)

            case .changeTask:
                break
        }
    }
}
