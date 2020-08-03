//
//  SetupTasksView+TaskSectionViewDelegate.swift
//  FromHome
//
//  Created by Daniboy on 8/3/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension SetupTasksView: TaskSectionViewDelegate {
    func presentChangeTaskAlert(taskSection: TaskSectionView, index: Int) {
        print("show alert, for section \(taskSection) and index \(index)")
    }
}
