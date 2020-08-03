//
//  TaskBodyView+Delegate.swift
//  FromHome
//
//  Created by Daniboy on 7/27/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension TasksBodyView: TaskSectionViewDelegate {

    func presentChangeTaskAlert() {

        let alertController = AlertViewController(.input(.changeTask))

        delegate?.present(alertController, completion: nil)
    }
}
